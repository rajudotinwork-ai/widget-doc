import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget documentation model
class WidgetDoc {
  final String name;
  final String explanation;
  final String exampleCode;
  final Widget preview;

  const WidgetDoc({
    required this.name,
    required this.explanation,
    required this.exampleCode,
    required this.preview,
  });
}

// List of widget documentations with live previews
final List<WidgetDoc> widgetDocs = [
  WidgetDoc(
    name: 'Text',
    explanation: 'The Text widget displays a styled string of text in the UI.',
    exampleCode: '''Text(
  'Hello Flutter!',
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)''',
    preview: const Text(
      'Hello Flutter!',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
  ),
  WidgetDoc(
    name: 'Container',
    explanation: 'A convenience widget for sizing, padding, and styling with decoration.',
    exampleCode: '''Container(
  width: 160,
  height: 90,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
  ),
  alignment: Alignment.center,
  child: const Text(
    'Container',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
)''',
    preview: Container(
      width: 160,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Container',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  ),
  WidgetDoc(
    name: 'Row',
    explanation: 'Displays its children in a horizontal array with flexible alignment.',
    exampleCode: '''Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Icon(Icons.star, color: Colors.amber),
    SizedBox(width: 6),
    Text('Item 1'),
    SizedBox(width: 20),
    Icon(Icons.star, color: Colors.amber),
    SizedBox(width: 6),
    Text('Item 2'),
  ],
)''',
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 6),
        Text('Item 1'),
        SizedBox(width: 20),
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 6),
        Text('Item 2'),
      ],
    ),
  ),
  WidgetDoc(
    name: 'Card',
    explanation: 'A Material Design surface with rounded corners and an elevation shadow.',
    exampleCode: '''Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Padding(
    padding: EdgeInsets.all(24),
    child: Text('This is inside a Card'),
  ),
)''',
    preview: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'This is inside a Card',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    ),
  ),
];

// Root application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Documentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const DocsHomePage(),
    );
  }
}

// Main documentation page
class DocsHomePage extends StatefulWidget {
  const DocsHomePage({super.key});

  @override
  State<DocsHomePage> createState() {
    return _DocsHomePageState();
  }
}

class _DocsHomePageState extends State<DocsHomePage> {
  int selectedIndex = 0;
  final List<String> widgets = const ['Text', 'Container', 'Row', 'Card'];

  @override
  Widget build(BuildContext context) {
    final currentDoc = widgetDocs[selectedIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Flutter Widgets Documentation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          // Left sidebar
          DocsSidebar(
            selectedIndex: selectedIndex,
            onSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          // Right content area (Documentation panel & live preview)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget Name
                  Text(
                    currentDoc.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Explanation
                  Text(
                    currentDoc.explanation,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Live Widget Preview
                  const Text(
                    'Live Preview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    alignment: Alignment.center,
                    child: currentDoc.preview,
                  ),
                  const SizedBox(height: 28),

                  // Example Code
                  const Text(
                    'Example Code',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E2E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SelectableText(
                      currentDoc.exampleCode,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 13.5,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Left sidebar component
class DocsSidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const DocsSidebar({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> widgets = const ['Text', 'Container', 'Row', 'Card'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Material(
        color: const Color(0xFFF7F8FA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Flutter Widgets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),

            Divider(height: 1, color: Colors.grey.shade300),

            Expanded(
              child: ListView.builder(
                itemCount: widgetDocs.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;

                  return ListTile(
                    title: Text(
                      widgetDocs[index].name,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.blue.shade700 : Colors.black87,
                      ),
                    ),
                    selected: isSelected,
                    selectedTileColor: Colors.blue.shade50,
                    onTap: () {
                      onSelected(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
