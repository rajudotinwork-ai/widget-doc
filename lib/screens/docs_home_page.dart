import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/widget_catalog.dart';
import '../models/widget_params.dart';
import '../widgets/docs_sidebar.dart';
import '../widgets/parameter_controls/widget_parameter_panel.dart';
import '../widgets/widget_preview.dart';

class DocsHomePage extends StatefulWidget {
  const DocsHomePage({super.key});

  @override
  State<DocsHomePage> createState() => _DocsHomePageState();
}

class _DocsHomePageState extends State<DocsHomePage> {
  int selectedIndex = 0;
  final AppWidgetParams _appParams = AppWidgetParams();

  @override
  Widget build(BuildContext context) {
    final currentWidget = widgetCatalog[selectedIndex];
    final currentParams = _appParams.getParamsFor(currentWidget.name);
    final currentCode = currentParams.toCode();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Live Preview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Text(
                          'Interactive',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 180),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    alignment: Alignment.center,
                    child: WidgetPreview(
                      widgetName: currentWidget.name,
                      appParams: _appParams,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Parameter Customization Section
                  WidgetParameterPanel(
                    widgetName: currentWidget.name,
                    appParams: _appParams,
                    onChanged: () {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 28),

                  // Example Code Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Generated Dart Code',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: currentCode));
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Dart code copied to clipboard!'),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        icon: const Icon(Icons.copy_rounded, size: 16),
                        label: const Text('Copy Code'),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                    ],
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
                      currentCode,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 13.5,
                        color: Colors.white,
                        height: 1.45,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
