/* eslint-disable @typescript-eslint/no-unused-vars */
import { AfterViewInit, Component, OnDestroy, ViewChild } from '@angular/core';
import { Canvas, DagaModule, DiagramComponent } from '@metadev/daga-angular';
import { Subscription } from 'rxjs';
import { DAGA_DIAGRAM_CONFIG } from './daga-diagram.config';

@Component({
  selector: 'app-daga-diagram',
  templateUrl: './daga-diagram.component.html',
  styleUrl: './daga-diagram.component.scss',
  imports: [DagaModule],
})
export class DagaDiagramComponent implements AfterViewInit, OnDestroy {
  @ViewChild(DiagramComponent) diagram!: DiagramComponent;

  config = DAGA_DIAGRAM_CONFIG;

  private canvas?: Canvas;
  private canvasSubscription?: Subscription;
  private diagramChangesSubscription?: Subscription;

  ngAfterViewInit(): void {
    this.canvasSubscription = this.diagram.canvas$.subscribe((canvas) => {
      this.canvas = canvas;
      this.diagramChangesSubscription?.unsubscribe();
      this.diagramChangesSubscription = canvas.diagramChange$.subscribe(
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        (change: any) => {
          console.log(change);
        }
      );
    });
  }
  ngOnDestroy(): void {
    this.canvasSubscription?.unsubscribe();
    this.diagramChangesSubscription?.unsubscribe();
  }
}
