import '../models/widget_info.dart';

final List<WidgetInfo> widgetCatalog = [
  // 1. Text
  const WidgetInfo(
    name: 'Text',
    explanation: 'The Text widget displays a styled string of text in the UI with customizable fonts, colors, and alignments.',
    exampleCode: '''Text(
  'Hello, Flutter!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    letterSpacing: 1.2,
  ),
)''',
  ),

  // 2. Container
  const WidgetInfo(
    name: 'Container',
    explanation: 'A convenience widget for sizing, padding, margins, and decorating with colors, borders, and shadows.',
    exampleCode: '''Container(
  width: 180,
  height: 100,
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.blue, Colors.indigo],
    ),
    borderRadius: BorderRadius.circular(16),
  ),
  alignment: Alignment.center,
  child: const Text('Styled Container', style: TextStyle(color: Colors.white)),
)''',
  ),

  // 3. Row
  const WidgetInfo(
    name: 'Row',
    explanation: 'Displays its children in a horizontal array with flexible alignment along the main and cross axes.',
    exampleCode: '''Row(
  mainAxisSize: MainAxisSize.min,
  children: const [
    Icon(Icons.star, color: Colors.amber),
    SizedBox(width: 8),
    Text('Star 1'),
    SizedBox(width: 24),
    Icon(Icons.favorite, color: Colors.redAccent),
    SizedBox(width: 8),
    Text('Heart 2'),
  ],
)''',
  ),

  // 4. Column
  const WidgetInfo(
    name: 'Column',
    explanation: 'Displays its children in a vertical array, arranging widgets from top to bottom with customizable spacing.',
    exampleCode: '''Column(
  mainAxisSize: MainAxisSize.min,
  children: const [
    CircleAvatar(radius: 26, child: Icon(Icons.person)),
    SizedBox(height: 10),
    Text('Alex Morgan', style: TextStyle(fontWeight: FontWeight.bold)),
    Text('Flutter Developer', style: TextStyle(color: Colors.grey)),
  ],
)''',
  ),

  // 5. Stack
  const WidgetInfo(
    name: 'Stack',
    explanation: 'Overlays widgets on top of each other, allowing absolute positioning of children with the Positioned widget.',
    exampleCode: '''Stack(
  children: [
    Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    Positioned(
      top: 8,
      right: 8,
      child: Chip(label: Text('NEW')),
    ),
  ],
)''',
  ),

  // 6. Card
  const WidgetInfo(
    name: 'Card',
    explanation: 'A Material Design surface with rounded corners, elevation drop shadows, and organized content padding.',
    exampleCode: '''Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Text('Card Content with elevation'),
  ),
)''',
  ),

  // 7. Icon
  const WidgetInfo(
    name: 'Icon',
    explanation: 'Renders graphical symbols from the Material Icons library, customizable by size, color, and semantic label.',
    exampleCode: '''Row(
  mainAxisSize: MainAxisSize.min,
  children: const [
    Icon(Icons.home_rounded, color: Colors.blue, size: 36),
    Icon(Icons.favorite_rounded, color: Colors.pink, size: 36),
    Icon(Icons.star_rounded, color: Colors.amber, size: 36),
  ],
)''',
  ),

  // 8. Image
  const WidgetInfo(
    name: 'Image',
    explanation: 'Displays images from assets, network URLs, files, or memory with configurable fitting and error handling.',
    exampleCode: '''Image.network(
  'https://example.com/image.png',
  width: 220,
  height: 130,
  fit: BoxFit.cover,
)''',
  ),

  // 9. ElevatedButton
  const WidgetInfo(
    name: 'ElevatedButton',
    explanation: 'A Material filled button with elevation that responds to user taps and interaction feedback.',
    exampleCode: '''ElevatedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.send_rounded),
  label: const Text('Send'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
)''',
  ),

  // 10. TextField
  const WidgetInfo(
    name: 'TextField',
    explanation: 'An interactive text input field allowing users to enter and edit text with customized borders and decorations.',
    exampleCode: '''TextField(
  decoration: InputDecoration(
    labelText: 'Search',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)''',
  ),

  // 11. ListView
  const WidgetInfo(
    name: 'ListView',
    explanation: 'A scrollable, linear list of widgets. The most commonly used scrolling widget in Flutter applications.',
    exampleCode: '''ListView.separated(
  itemCount: items.length,
  separatorBuilder: (context, index) => const Divider(),
  itemBuilder: (context, index) => ListTile(
    title: Text('Item \$index'),
  ),
)''',
  ),

  // 12. GridView
  const WidgetInfo(
    name: 'GridView',
    explanation: 'A 2-dimensional scrollable array of widgets, arranging items into customizable rows and columns.',
    exampleCode: '''GridView.count(
  crossAxisCount: 2,
  mainAxisSpacing: 8,
  crossAxisSpacing: 8,
  children: [
    Container(color: Colors.blue.shade100),
    Container(color: Colors.teal.shade100),
  ],
)''',
  ),

  // 13. Wrap
  const WidgetInfo(
    name: 'Wrap',
    explanation: 'Displays children in multiple horizontal or vertical runs, automatically breaking into a new line when out of space.',
    exampleCode: '''Wrap(
  spacing: 8.0,
  runSpacing: 8.0,
  children: [
    Chip(label: Text('Flutter')),
    Chip(label: Text('Dart')),
    Chip(label: Text('Widgets')),
  ],
)''',
  ),
];
