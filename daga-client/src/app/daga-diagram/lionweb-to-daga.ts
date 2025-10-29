import { LionWebJsonChunk, LionWebJsonNode } from '@lionweb/json';
import {
  AdjacencyLayout,
  ClosedShape,
  DiagramConfig,
  DiagramModel,
  DiagramModelExporter,
  DiagramModelImporter,
  LineShape,
  LineStyle,
  Property,
  Side,
  Type,
} from '@metadev/daga-angular';

export enum CLASSIFIER_KEYS {
  ANNOTATION = 'Annotation',
  CONCEPT = 'Concept',
  CONTAINMENT = 'Containment',
  ENUMERATON = 'Enumeration',
  ENUMERATON_LITERAL = 'EnumerationLiteral',
  PROPERTY = 'Property',
  PROPERTY_TYPE = 'Property-type',
}

export enum CONTAINMENT_KEYS {
  CLASSIFIER_FEATURES = 'Classifier-features',
  ENUMERATON_LITERALS = 'Enumeration-literals',
}

export enum PROPERTY_KEYS {
  KEY = 'IKeyed-key',
  NAME = 'LionCore-builtins-INamed-name',
  ABSTRACT = 'Concept-abstract',
  PARTITION = 'Concept-partition',
}

export enum REFERENCE_KEYS {
  LINK = 'Link-type',
}

export const lionWebToDaga = (
  lionWebModel: LionWebJsonChunk
): [
  DiagramConfig,
  DiagramModelImporter<LionWebJsonChunk>,
  DiagramModelExporter<LionWebJsonChunk>
] => {
  const diagramConfig: DiagramConfig = {
    canvas: {
      grid: {
        spacing: 50,
        snap: true,
      },
    },
    components: {
      buttons: {},
      palette: {
        sections: [
          {
            name: '',
            templates: [],
          },
        ],
      },
      propertyEditor: {},
    },
    nodeTypeDefaults: {
      defaultWidth: 150,
      defaultHeight: 50,
      label: {
        fontSize: 20,
        margin: 10,
        fit: true,
      },
      ports: [
        {
          coords: [75, 0],
          direction: Side.Top,
        },
        {
          coords: [0, 25],
          direction: Side.Left,
        },
        {
          coords: [75, 50],
          direction: Side.Bottom,
        },
        {
          coords: [150, 25],
          direction: Side.Right,
        },
      ],
      look: {
        lookType: 'shaped-look',
        shape: ClosedShape.Rectangle,
        fillColor: '#FFFFFF',
        borderColor: '#000000',
        borderThickness: 1,
        selected: {
          fillColor: '#FFAAFF',
          borderColor: '#AA00AA',
        },
        highlighted: {
          borderThickness: 3,
        },
      },
    },
    nodeTypes: [],
    connectionTypeDefaults: {
      look: {
        lookType: 'connection-look',
        color: '#000000',
        thickness: 2,
        style: LineStyle.Solid,
        shape: LineShape.Bezier,
        selected: {
          color: '#AA00AA',
        },
        highlighted: {
          thickness: 4,
        },
      },
    },
    connectionTypes: [],
  };

  lionWebModel.nodes
    .filter((node) => node.classifier.key === CLASSIFIER_KEYS.CONCEPT)
    .forEach((node) => {
      const nodeId =
        node.properties.find((p) => p.property.key === PROPERTY_KEYS.KEY)?.value || node.id;
      const nodeName =
        node.properties.find((p) => p.property.key === PROPERTY_KEYS.NAME)?.value || node.id;
      diagramConfig.nodeTypes.push({
        id: nodeId,
        name: nodeName,
        properties: [
          {
            name: 'name',
            label: 'name',
            type: Type.Text,
            defaultValue: nodeName,
            basic: true,
            editable: true,
            rootAttribute: 'name',
          },
          ...extractProperties(lionWebModel, node),
        ],
      });
      diagramConfig.components.palette.sections[0].templates.push({
        templateType: 'node',
        type: nodeId,
        label: nodeName,
      });
    });

  lionWebModel.nodes
    .filter((node) => node.classifier.key === CLASSIFIER_KEYS.CONTAINMENT)
    .forEach((node) => {
      const nodeId =
        node.properties.find((p) => p.property.key === PROPERTY_KEYS.KEY)?.value || node.id;
      const nodeName =
        node.properties.find((p) => p.property.key === PROPERTY_KEYS.NAME)?.value || node.id;
      const startTypes = node.parent;
      const endTypes = node.references
        .find((r) => r.reference.key === REFERENCE_KEYS.LINK)
        ?.targets?.map((t) => lionWebModel.nodes.find((n) => n.id === t.reference)) // TODO: USE KEY INSTEAD OF ID?
        ?.filter((t) => !!t)
        ?.flatMap((t) => getChildren(lionWebModel, t))
        ?.map((n) => n.id); // TODO: USE KEY INSTEAD OF ID?
      diagramConfig.connectionTypes.push({
        id: nodeId,
        name: nodeName,
        startTypes,
        endTypes,
      });
    });

  const diagramModelImporter: DiagramModelImporter<LionWebJsonChunk> = {
    import: (model: DiagramModel, data: LionWebJsonChunk): DiagramModel => {
      model.clear();
      data.nodes.forEach((node) => {
        const nodeType = model.nodes.types.get(node.classifier.key);
        if (nodeType) {
          const newNode = model.nodes.new(node.classifier.key, [0, 0], node.id);
          for (const nodeProperty of nodeType.propertySet.propertyList) {
            const propertyValue = node.properties.find(
              (p) => p.property.key === nodeProperty.name
            )?.value;
            if (nodeProperty.type === Type.Boolean) {
              newNode.valueSet.setValue(nodeProperty.name, propertyValue !== 'false');
            } else if (nodeProperty.type === Type.Number) {
              newNode.valueSet.setValue(nodeProperty.name, new Number(propertyValue));
            } else if (nodeProperty.type === Type.Text) {
              newNode.valueSet.setValue(nodeProperty.name, propertyValue);
            } else if (nodeProperty.type === Type.Option) {
              newNode.valueSet.setValue(nodeProperty.name, propertyValue);
            }
          }
          newNode.name =
            node.properties.find((p) => p.property.key === PROPERTY_KEYS.NAME)?.value || node.id;
        }
      });
      data.nodes.forEach((node) => {
        const newNode = model.nodes.get(node.id);
        node.containments.forEach((c) => {
          const connectionType = model.connections.types.get(c.containment.key);
          c.children.forEach((child) => {
            const childNode = model.nodes.get(child);
            if (childNode) {
              model.connections.new(
                connectionType,
                newNode.ports[0],
                childNode.ports[0],
                `${newNode.id}_${childNode.id}`
              );
            }
          });
        });
      });
      new AdjacencyLayout().apply(model);
      return model;
    },
  };
  const diagramModelExporter: DiagramModelExporter<LionWebJsonChunk> = {
    export: (model: DiagramModel): LionWebJsonChunk => {
      for (const node of model.nodes) {
      }
      return undefined as unknown as LionWebJsonChunk;
    },
  };
  return [diagramConfig, diagramModelImporter, diagramModelExporter];
};

const getChildren = (lionWebModel: LionWebJsonChunk, node: LionWebJsonNode): LionWebJsonNode[] => {
  const result: LionWebJsonNode[] = [];
  const immediateChildren = lionWebModel.nodes.filter((n) =>
    n.references.find(
      (r) =>
        (r.reference.key === 'Concept-extends' || r.reference.key === 'Concept-implements') &&
        r.targets.find((t) => t.reference === node.id) // <-- TODO: SHOULD PROBABLY USE KEY OF NODE INSTEAD OF ID OF NODE
    )
  );
  for (const immediateChild of immediateChildren) {
    result.push(immediateChild);
    const grandChildren = getChildren(lionWebModel, immediateChild);
    for (const grandChild of grandChildren) {
      result.push(grandChild);
    }
  }
  return result;
};

const getParents = (lionWebModel: LionWebJsonChunk, node: LionWebJsonNode): LionWebJsonNode[] => {
  const result: LionWebJsonNode[] = [];
  const extendsOrImplements =
    node.references.filter(
      (r) => r.reference.key === 'Concept-extends' || r.reference.key === 'Concept-implements'
    ) || [];
  const targets = extendsOrImplements.flatMap((eoi) => eoi.targets);
  for (const target of targets) {
    const parent = lionWebModel.nodes.find((n) => n.id === target.reference);
    if (parent && !result.find((p) => p.id === parent.id)) {
      result.push(parent);
      // trusting that the extends/implements relations contain no loops
      const grandparents = getParents(lionWebModel, parent);
      for (const grandparent of grandparents) {
        if (!result.find((p) => p.id === grandparent.id)) {
          result.push(grandparent);
        }
      }
    }
  }
  return result;
};

const extractProperties = (lionWebModel: LionWebJsonChunk, node: LionWebJsonNode): Property[] => {
  const lionWebProperties: LionWebJsonNode[] = [];
  // extract properties of this node
  for (const propertyId of node.containments.find(
    (c) => c.containment.key === CONTAINMENT_KEYS.CLASSIFIER_FEATURES
  )?.children || []) {
    const property = lionWebModel.nodes.find(
      (n) => n.id === propertyId && n.classifier.key === CLASSIFIER_KEYS.PROPERTY
    );
    if (property) {
      lionWebProperties.push(property);
    }
  }
  // extract properties of interfaces that this node extends
  const parents = getParents(lionWebModel, node);
  for (const parent of parents) {
    for (const propertyId of parent.containments.find(
      (c) => c.containment.key === CONTAINMENT_KEYS.CLASSIFIER_FEATURES
    )?.children || []) {
      const property = lionWebModel.nodes.find(
        (n) => n.id === propertyId && n.classifier.key === CLASSIFIER_KEYS.PROPERTY
      );
      if (property) {
        lionWebProperties.push(property);
      }
    }
  }
  // turn the LionWeb properties into Daga properties
  const result: Property[] = [];
  for (const lionWebProperty of lionWebProperties) {
    const propertyType = lionWebProperty.references.find(
      (r) => r.reference.key === CLASSIFIER_KEYS.PROPERTY_TYPE
    );
    let type = Type.Text;
    let defaultValue: unknown = '';
    let options: unknown[] | undefined = undefined;
    if (propertyType) {
      const propertyTypeResolveInfo = propertyType.targets[0]?.resolveInfo || '';
      if (propertyTypeResolveInfo === 'Boolean') {
        type = Type.Boolean;
        defaultValue = false;
      } else if (propertyTypeResolveInfo === 'Integer') {
        type = Type.Number;
        defaultValue = 0;
      } else if (propertyTypeResolveInfo === 'String') {
        type = Type.Text;
        defaultValue = '';
      } else {
        const enumerationNode = lionWebModel.nodes.find(
          (n) => n.id === propertyTypeResolveInfo && n.classifier.key === CLASSIFIER_KEYS.ENUMERATON
        );
        // property is an enumeration
        if (enumerationNode) {
          type = Type.Option;
          options = [];
          const enumerationLiterals = enumerationNode.containments.find(
            (c) => c.containment.key === CONTAINMENT_KEYS.ENUMERATON_LITERALS
          );
          if (enumerationLiterals) {
            for (const enumerationLiteral of enumerationLiterals.children) {
              const enumerationLiteralNode = lionWebModel.nodes.find(
                (n) =>
                  n.id === enumerationLiteral &&
                  n.classifier.key === CLASSIFIER_KEYS.ENUMERATON_LITERAL
              );
              if (enumerationLiteralNode) {
                const enumerationLiteralNodeKey =
                  enumerationLiteralNode.properties.find(
                    (p) => p.property.key === PROPERTY_KEYS.KEY
                  )?.value || enumerationLiteralNode.id;
                const enumerationLiteralNodeLabel =
                  enumerationLiteralNode.properties.find(
                    (p) => p.property.key === PROPERTY_KEYS.NAME
                  )?.value || enumerationLiteralNode.id;
                options.push({
                  key: enumerationLiteralNodeKey,
                  label: enumerationLiteralNodeLabel,
                });
              }
            }
          }
        }
      }
    }
    const lionWebPropertyName =
      lionWebProperty.properties.find((p) => p.property.key === PROPERTY_KEYS.KEY)?.value ||
      lionWebProperty.id;
    const lionWebPropertyLabel =
      lionWebProperty.properties.find((p) => p.property.key === PROPERTY_KEYS.NAME)?.value ||
      lionWebProperty.id;
    result.push({
      name: lionWebPropertyName,
      label: lionWebPropertyLabel,
      type,
      defaultValue,
      basic: true,
      editable: true,
      rootAttribute: undefined,
      options,
      properties: undefined,
    });
  }
  return result;
};
