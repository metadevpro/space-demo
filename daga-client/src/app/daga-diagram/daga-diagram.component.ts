/* eslint-disable @typescript-eslint/no-unused-vars */
import { AfterViewInit, Component, OnDestroy, ViewChild } from '@angular/core';
import { INodeBase } from '@lionweb/class-core';
import { LionWebClient } from '@lionweb/delta-protocol-client';
import { createBrowserLowLevelClient } from '@lionweb/delta-protocol-low-level-client-browser';
import { LionWebJsonChunk } from '@lionweb/json';
import {
  AdjacencyLayout,
  Canvas,
  DagaModule,
  DiagramAction,
  DiagramActionMethod,
  DiagramComponent,
  DiagramEvent,
  DiagramEvents,
  DiagramModelExporter,
  DiagramModelImporter,
  DiagramNode,
} from '@metadev/daga-angular';
import { delay, Subscription } from 'rxjs';
import { SPACE_DIAGRAM_CONFIG } from './daga-diagram.config';
import { allLanguageBases } from './gen/index.g';
import { PowerConsumer, PowerModule, PowerSource } from './gen/PowerBudget.g';
import { KeyValuePipe } from '@angular/common';
import { Finding } from './gen/Finding.g';

@Component({
  selector: 'app-daga-diagram',
  templateUrl: './daga-diagram.component.html',
  styleUrl: './daga-diagram.component.scss',
  imports: [DagaModule, KeyValuePipe],
})
export class DagaDiagramComponent implements AfterViewInit, OnDestroy {
  @ViewChild(DiagramComponent) diagram!: DiagramComponent;

  config = SPACE_DIAGRAM_CONFIG;

  importer!: DiagramModelImporter<LionWebJsonChunk>;
  exporter!: DiagramModelExporter<LionWebJsonChunk>;

  private canvas?: Canvas;
  private canvasSubscription?: Subscription;
  private diagramChangesSubscription?: Subscription;
  private diagramEventsSubscription?: Subscription;

  private client?: LionWebClient;
  annotations: { [key: string]: string } = {};

  ngAfterViewInit(): void {
    let queryNumber = 0;
    const uniqueQueryId = () => `query-${++queryNumber}`;

    this.canvasSubscription = this.diagram.canvas$.pipe(delay(0)).subscribe((canvas) => {
      this.canvas = canvas;

      console.log(`creating client`);
      LionWebClient.create({
        clientId: 'TS-client-1',
        url: 'ws://localhost:40000',
        languageBases: allLanguageBases,
        lowLevelClientInstantiator: (lowLevelClientParameters) =>
          createBrowserLowLevelClient(lowLevelClientParameters, (logItem) => {
            console.log(`low-level log item: ${trimTo(JSON.stringify(logItem))}`);
            console.dir(logItem);
            // TODO: is it possible to type this more precisely?
            const receivedMessage = (logItem as any).receivedOnClient;
            if (receivedMessage) {
              this.receiveMessage(receivedMessage);
            }
          }),
        semanticLogger: (logItem) => {
          console.log(trimTo(logItem.asText()));
          console.dir(logItem);
        },
      }).then((client) => {
        console.log(`client created`);
        this.client = client;

        console.log(`signing in`);
        client.signOn(uniqueQueryId(), 'myRepo').then(() => {
          console.log(`signed on`);

          console.log(`getting list of partitions`);
          client.listPartitions(uniqueQueryId()).then((partitionInfo) => {
            const partitionIds = partitionInfo.nodes
              .filter((partitionJson) => partitionJson.parent === null)
              .map(({ id }) => id);
            console.log(`list of IDs of partitions: ${partitionIds.join(', ')}`);
            if (partitionIds.length === 0) {
              return;
            }
            const partitionId = partitionIds[0];

            console.log(`subscribing to partition ${partitionId}`);
            client
              .subscribeToPartitionContents(uniqueQueryId(), partitionId)
              .then((receivedPartitionJson) => {
                console.log(`deserializing partition`);
                const receivedModel = client.deserialize(receivedPartitionJson);
                client.setModel(receivedModel);

                this.importModel(receivedModel);

                console.log(`(done initializing)`);
              });
          });
        });
      });

      this.diagramChangesSubscription?.unsubscribe();
      this.diagramChangesSubscription = this.canvas.diagramChange$.subscribe(
        (change: { action: DiagramAction; method: DiagramActionMethod }) => {
          // TODO: SEND THE CHANGES TO LIONWEB
          console.log(change);
        }
      );

      this.diagramEventsSubscription?.unsubscribe();
      this.diagramEventsSubscription = this.canvas.diagramEvent$.subscribe(
        (event: DiagramEvent) => {
          if (event.type === DiagramEvents.Selection) {
            /*
            for (const eventTarget of event.targets) {
              if (eventTarget instanceof DiagramNode) {
                this.updateNodeDecorators(eventTarget);
              }
            }*/
            // force the update of all nodes to prevent weirdness the first time we deselect a node
            for (const node of this.canvas.model.nodes) {
              this.updateNodeDecorators(node);
            }
          }
        }
      );
    });
  }
  ngOnDestroy(): void {
    this.canvasSubscription?.unsubscribe();
    this.diagramChangesSubscription?.unsubscribe();
    this.diagramEventsSubscription?.unsubscribe();
  }

  private importModel(model: INodeBase[]): void {
    for (const node of model) {
      this.importNode(node);
    }

    new AdjacencyLayout().apply(this.canvas.model);
    this.canvas.center();
  }

  private importNode(node: INodeBase): DiagramNode | undefined {
    const nodeType = this.canvas.model.nodes.types.get(node.classifier.key);
    if (nodeType) {
      const newNode = this.canvas.model.nodes.new(nodeType, [0, 0], node.id);

      if (node instanceof PowerModule) {
        for (const nodeContent of node.contents) {
          const childNode = this.importNode(nodeContent);
          if (childNode) {
            this.canvas.model.connections.new(
              'PowerModule-contents',
              newNode.ports[0],
              childNode.ports[0],
              `${newNode.id}_${childNode.id}`
            );
          }
        }
        newNode.valueSet.setValue('name', node.name);
        node.annotations.forEach((a) => {
          if (a instanceof Finding) {
            this.annotations[a.id] = a.message || a.locationMessage;
          }
        });
      } else if (node instanceof PowerConsumer) {
        newNode.valueSet.setValue('name', node.name);
        newNode.valueSet.setValue('IPowerParticipant-peak', node.peak);
        newNode.valueSet.setValue('IPowerParticipant-continuous', node.continuous);
        node.annotations.forEach((a) => {
          if (a instanceof Finding) {
            this.annotations[a.id] = a.message || a.locationMessage;
          }
        });
      } else if (node instanceof PowerSource) {
        newNode.valueSet.setValue('name', node.name);
        newNode.valueSet.setValue('PowerSource-kind', node.kind);
        newNode.valueSet.setValue('IPowerParticipant-peak', node.peak);
        newNode.valueSet.setValue('IPowerParticipant-continuous', node.continuous);
        node.annotations.forEach((a) => {
          if (a instanceof Finding) {
            this.annotations[a.id] = a.message || a.locationMessage;
          }
        });
      }

      this.updateNodeDecorators(newNode);

      return newNode;
    }
    return undefined;
  }

  updateNodeDecorators(node: DiagramNode): void {
    for (const existingDecorator of node.decorators) {
      this.canvas.model.decorators.remove(existingDecorator.id);
    }

    let iconPath = '';
    let backgroundColor = '';
    let textColor = '';
    switch (node.type.id) {
      case 'PowerConsumer':
        if (node.selected) {
          iconPath = '/diagram/decorator/plug-white.svg';
          backgroundColor = '#902a9c';
          textColor = '#ffffff';
        } else {
          iconPath = '/diagram/decorator/plug.svg';
          backgroundColor = '#eadff2';
          textColor = '#000000';
        }
        break;
      case 'PowerModule':
        if (node.selected) {
          iconPath = '/diagram/decorator/chip-white.svg';
          backgroundColor = '#00729c';
          textColor = '#ffffff';
        } else {
          iconPath = '/diagram/decorator/chip.svg';
          backgroundColor = '#dff3f7';
          textColor = '#000000';
        }
        break;
      case 'PowerSource':
        if (node.selected) {
          iconPath = '/diagram/decorator/battery-white.svg';
          backgroundColor = '#849c00';
          textColor = '#ffffff';
        } else {
          iconPath = '/diagram/decorator/battery.svg';
          backgroundColor = '#f2f7df';
          textColor = '#000000';
        }
        break;
    }

    this.canvas.model.decorators.new(
      node,
      node.coords,
      50,
      50,
      node.getPriority(),
      `
        <img
          src="${iconPath}"
          style="position: absolute; left: 12px; top: 12px; width: 26px; height: 26px;"
        />
      `,
      `${node.id}-icon-decorator`
    );

    if (node.type.id === 'PowerConsumer' || node.type.id === 'PowerSource') {
      const powerDecoratorMargin = 10;
      const powerDecoratorWidth = node.height;
      const powerDecoratorHeight = node.height - powerDecoratorMargin * 2;
      this.canvas.model.decorators.new(
        node,
        [
          node.coords[0] + node.width - powerDecoratorMargin - powerDecoratorWidth,
          node.coords[1] + powerDecoratorMargin,
        ],
        powerDecoratorWidth,
        powerDecoratorHeight,
        node.getPriority(),
        `
        <span
          style="
            display: block;
            box-sizing: border-box;
            position: absolute;
            right: 0px;
            top: 0px;
            min-width: ${powerDecoratorHeight}px;
            max-width: ${powerDecoratorWidth}px;
            height: ${powerDecoratorHeight}px;
            border-radius: ${powerDecoratorHeight / 2}px;
            padding: 6px 10px;
            background-color: ${backgroundColor};
            color: ${textColor};
          "
        >
          ${node.valueSet.getValue('IPowerParticipant-peak')}
        </span>
      `,
        `${node.id}-power-decorator`
      );
    }
  }

  private receiveMessage(message: any): void {
    if (message.messageKind === 'PropertyChanged') {
      const node = this.canvas.model.nodes.get(message.node);
      // TODO: take into account sequence number? to ensure we don't overwrite a newer change with an older change
      if (node) {
        node.valueSet.setValue(message.property.key, message.newValue);
        this.updateNodeDecorators(node);
      }
    } else if (message.messageKind === 'AnnotationAdded') {
      for (const node of message.newAnnotation.nodes) {
        this.annotations[node.id] = node.properties.find(
          (p: any) => p.property.key === 'Finding-message'
        ).value;
      }
    } else if (message.messageKind === 'AnnotationDeleted') {
      delete this.annotations[message.deletedAnnotation];
    }
  }
}

const maxLogLength = 200;
const trimTo = (text: string) =>
  text.length <= maxLogLength ? text : text.substring(0, maxLogLength - 1) + '…'; // limit it to exactly maxLogLength
