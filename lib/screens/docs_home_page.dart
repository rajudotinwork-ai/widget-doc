import 'package:flutter/material.dart';

import '../data/widget_catalog.dart';
import '../widgets/docs_sidebar.dart';
import '../widgets/widget_preview.dart';

class DocsHomePage extends StatefulWidget {
  const DocsHomePage({super.key});

  @override
  State<DocsHomePage> createState() => _DocsHomePageState();
}

class _DocsHomePageState extends State<DocsHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentWidget = widgetCatalog[selectedIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Flutter Widgets Documentation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Row(
        children: [
          // Left navigation sidebar
          DocsSidebar(
            selectedIndex: selectedIndex,
            onSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          // Right content area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget Name
                  Text(
                    currentWidget.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Widget Explanation
                  Text(
                    currentWidget.explanation,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Live Preview Section
                  const Text(
                    'Live Preview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 180),
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    alignment: Alignment.center,
                    child: WidgetPreview(widgetName: currentWidget.name),
                  ),
                  const SizedBox(height: 28),

                  // Example Code Section
                  const Text(
                    'Example Code',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E2E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SelectableText(
                      currentWidget.exampleCode,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 13.5,
                        color: Colors.white,
                        height: 1.45,
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
