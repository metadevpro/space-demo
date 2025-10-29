import {
  DiagramConfig,
  HorizontalAlign,
  LineShape,
  LineStyle,
  Side,
  Type,
  VerticalAlign,
} from '@metadev/daga-angular';

const RECTANGLE_RADIUS = 8;

const roundedRectangleShape = (x: number, y: number, width: number, height: number) => {
  return `M ${x + RECTANGLE_RADIUS} ${y} L ${
    x + width - RECTANGLE_RADIUS
  } ${y} A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${x + width} ${y + RECTANGLE_RADIUS} L ${
    x + width
  } ${y + height - RECTANGLE_RADIUS} A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${
    x + width - RECTANGLE_RADIUS
  } ${y + height} L ${x + RECTANGLE_RADIUS} ${
    y + height
  } A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${x} ${y + height - RECTANGLE_RADIUS} L ${x} ${
    y + RECTANGLE_RADIUS
  } A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${x + RECTANGLE_RADIUS} ${y} Z`;
};

const leftRoundedRectangleShape = (x: number, y: number, width: number, height: number) => {
  return `M ${x + RECTANGLE_RADIUS} ${y} L ${x + width} ${y} L ${x + width} ${y + height} L ${
    x + RECTANGLE_RADIUS
  } ${y + height} A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${x} ${
    y + height - RECTANGLE_RADIUS
  } L ${x} ${y + RECTANGLE_RADIUS} A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${
    x + RECTANGLE_RADIUS
  } ${y} Z`;
};

const rightRoundedRectangleShape = (x: number, y: number, width: number, height: number) => {
  return `M ${x} ${y} L ${
    x + width - RECTANGLE_RADIUS
  } ${y} A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${x + width} ${y + RECTANGLE_RADIUS} L ${
    x + width
  } ${y + height - RECTANGLE_RADIUS} A ${RECTANGLE_RADIUS} ${RECTANGLE_RADIUS} 0 0 1 ${
    x + width - RECTANGLE_RADIUS
  } ${y + height} L ${x} ${y + height} L ${x} ${y} Z`;
};

export const SPACE_DIAGRAM_CONFIG: DiagramConfig = {
  type: 'space-diagram',
  userActions: {
    'context-menu': false,
  },
  canvas: {
    grid: {
      spacing: 50,
      snap: true,
    },
  },
  connectionSettings: {
    inferConnectionType: true,
    defaultConnection: 'PowerModule-contents',
  },
  components: {
    buttons: {},
    palette: {
      width: '17rem',
      sections: [
        {
          name: '',
          templates: [
            {
              templateType: 'node',
              type: 'PowerModule',
              label: '',
              look: {
                lookType: 'image-look',
                backgroundImage: '/diagram/palette/power-module.svg',
              },
              width: 242,
              height: 50,
            },
            {
              templateType: 'node',
              type: 'PowerSource',
              label: '',
              look: {
                lookType: 'image-look',
                backgroundImage: '/diagram/palette/power-source.svg',
              },
              width: 242,
              height: 50,
            },
            {
              templateType: 'node',
              type: 'PowerConsumer',
              label: '',
              look: {
                lookType: 'image-look',
                backgroundImage: '/diagram/palette/power-consumer.svg',
              },
              width: 242,
              height: 50,
            },
          ],
        },
      ],
    },
    propertyEditor: {},
  },
  nodeTypeDefaults: {
    defaultWidth: 150,
    defaultHeight: 50,
    minWidth: 150,
    minHeight: 50,
    resizableX: false,
    resizableY: false,
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
  },
  nodeTypes: [
    {
      id: 'PowerConsumer',
      name: 'PowerConsumer',
      sectionGrid: {
        defaultWidths: [50, 100],
        defaultHeights: [50],
        minWidths: [50, 100],
        minHeights: [50],
        margin: 0,
        sections: [
          [
            {
              look: {
                lookType: 'shaped-look',
                shape: leftRoundedRectangleShape,
                fillColor: '#eadff2',
                borderColor: 'none',
                borderThickness: 1,
                selected: {
                  fillColor: '#902a9c',
                  borderColor: 'none',
                },
              },
            },
            {
              label: {
                fontSize: 15,
                margin: [10, 60, 10, 10],
                horizontalAlign: HorizontalAlign.Left,
                verticalAlign: VerticalAlign.Center,
                fit: true,
                editable: false,
              },
              look: {
                lookType: 'shaped-look',
                shape: rightRoundedRectangleShape,
                fillColor: '#ffffff',
                borderColor: 'none',
                borderThickness: 1,
                selected: {
                  fillColor: '#eadff2',
                  borderColor: 'none',
                },
              },
            },
          ],
        ],
      },
      look: {
        lookType: 'shaped-look',
        shape: roundedRectangleShape,
        fillColor: 'none',
        borderColor: '#902a9c',
        borderThickness: 1,
        highlighted: {
          borderThickness: 2,
        },
      },
      properties: [
        {
          name: 'name',
          label: 'name',
          type: Type.Text,
          defaultValue: 'PowerConsumer',
          basic: true,
          editable: true,
          rootAttribute: ['sections', 1, 'name'],
        },
        {
          name: 'IPowerParticipant-peak',
          label: 'peak',
          type: Type.Number,
          defaultValue: 0,
          basic: true,
          editable: true,
        },
        {
          name: 'IPowerParticipant-continuous',
          label: 'continuous',
          type: Type.Number,
          defaultValue: 0,
          basic: true,
          editable: true,
        },
      ],
    },
    {
      id: 'PowerModule',
      name: 'PowerModule',
      sectionGrid: {
        defaultWidths: [50, 100],
        defaultHeights: [50],
        minWidths: [50, 100],
        minHeights: [50],
        margin: 0,
        sections: [
          [
            {
              look: {
                lookType: 'shaped-look',
                shape: leftRoundedRectangleShape,
                fillColor: '#dff3f7',
                borderColor: 'none',
                borderThickness: 1,
                selected: {
                  fillColor: '#00729c',
                  borderColor: 'none',
                },
              },
            },
            {
              label: {
                fontSize: 15,
                margin: 10,
                horizontalAlign: HorizontalAlign.Left,
                verticalAlign: VerticalAlign.Center,
                fit: true,
                editable: false,
              },
              look: {
                lookType: 'shaped-look',
                shape: rightRoundedRectangleShape,
                fillColor: '#ffffff',
                borderColor: 'none',
                borderThickness: 1,
                selected: {
                  fillColor: '#dff3f7',
                  borderColor: 'none',
                },
              },
            },
          ],
        ],
      },
      look: {
        lookType: 'shaped-look',
        shape: roundedRectangleShape,
        fillColor: 'none',
        borderColor: '#00729c',
        borderThickness: 1,
        highlighted: {
          borderThickness: 2,
        },
      },
      properties: [
        {
          name: 'name',
          label: 'name',
          type: Type.Text,
          defaultValue: 'PowerModule',
          basic: true,
          editable: true,
          rootAttribute: ['sections', 1, 'name'],
        },
        /*
        {
          name: 'PowerSource-total-peak',
          label: 'total source peak',
          type: Type.Number,
          defaultValue: 0,
          basic: true,
          editable: false,
        },
        {
          name: 'PowerConsumer-total-peak',
          label: 'total consumer peak',
          type: Type.Number,
          defaultValue: 0,
          basic: true,
          editable: false,
        },
        */
      ],
    },
    {
      id: 'PowerSource',
      name: 'PowerSource',
      sectionGrid: {
        defaultWidths: [50, 100],
        defaultHeights: [50],
        minWidths: [50, 100],
        minHeights: [50],
        margin: 0,
        sections: [
          [
            {
              look: {
                lookType: 'shaped-look',
                shape: leftRoundedRectangleShape,
                fillColor: '#f2f7df',
                borderColor: 'none',
                borderThickness: 1,
                selected: {
                  fillColor: '#849c00',
                  borderColor: 'none',
                },
              },
            },
            {
              label: {
                fontSize: 15,
                margin: [10, 60, 10, 10],
                horizontalAlign: HorizontalAlign.Left,
                verticalAlign: VerticalAlign.Center,
                fit: true,
                editable: false,
              },
              look: {
                lookType: 'shaped-look',
                shape: rightRoundedRectangleShape,
                fillColor: '#ffffff',
                borderColor: 'none',
                borderThickness: 1,
                selected: {
                  fillColor: '#f2f7df',
                  borderColor: 'none',
                },
              },
            },
          ],
        ],
      },
      look: {
        lookType: 'shaped-look',
        shape: roundedRectangleShape,
        fillColor: 'none',
        borderColor: '#849c00',
        borderThickness: 1,
        highlighted: {
          borderThickness: 2,
        },
      },
      properties: [
        {
          name: 'name',
          label: 'name',
          type: Type.Text,
          defaultValue: 'PowerSource',
          basic: true,
          editable: true,
          rootAttribute: ['sections', 1, 'name'],
        },
        {
          name: 'PowerSource-kind',
          label: 'kind',
          type: Type.Option,
          defaultValue: '',
          basic: true,
          editable: true,
          options: [
            {
              key: 'PowerSourceKind-solar',
              label: 'solar',
            },
            {
              key: 'PowerSourceKind-nuclear',
              label: 'nuclear',
            },
            {
              key: 'PowerSourceKind-diesel',
              label: 'diesel',
            },
          ],
        },
        {
          name: 'IPowerParticipant-peak',
          label: 'peak',
          type: Type.Number,
          defaultValue: 0,
          basic: true,
          editable: true,
        },
        {
          name: 'IPowerParticipant-continuous',
          label: 'continuous',
          type: Type.Number,
          defaultValue: 0,
          basic: true,
          editable: true,
        },
      ],
    },
  ],
  connectionTypeDefaults: {
    look: {
      lookType: 'connection-look',
      color: '#626262',
      thickness: 2,
      style: LineStyle.Solid,
      shape: LineShape.Bezier,
      selected: {
        color: '#000000',
      },
      highlighted: {
        thickness: 4,
      },
    },
  },
  connectionTypes: [
    {
      id: 'PowerModule-contents',
      name: 'contents',
      startTypes: 'PowerModule',
      endTypes: ['PowerConsumer', 'PowerSource'],
    },
  ],
};
