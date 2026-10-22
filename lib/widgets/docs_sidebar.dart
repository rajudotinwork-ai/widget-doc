import 'package:flutter/material.dart';

import '../data/widget_catalog.dart';
import '../models/widget_info.dart';

class DocsSidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<WidgetInfo> items;

  DocsSidebar({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    List<WidgetInfo>? items,
  }) : items = items ?? widgetCatalog;

  static const Map<String, IconData> _widgetIcons = {
    'Text': Icons.text_fields_rounded,
    'Container': Icons.crop_square_rounded,
    'Row': Icons.table_rows_rounded,
    'Column': Icons.view_column_rounded,
    'Stack': Icons.layers_rounded,
    'Card': Icons.credit_card_rounded,
    'Icon': Icons.emoji_emotions_outlined,
    'Image': Icons.image_rounded,
    'ElevatedButton': Icons.smart_button_rounded,
    'TextField': Icons.input_rounded,
    'ListView': Icons.view_list_rounded,
    'GridView': Icons.grid_view_rounded,
    'Wrap': Icons.wrap_text_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Material(
        color: const Color(0xFFF7F8FA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter Widgets',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Select a widget to preview',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  final widgetInfo = items[index];
                  final icon =
                      _widgetIcons[widgetInfo.name] ?? Icons.widgets_outlined;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: ListTile(
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: Icon(
                        icon,
                        size: 20,
                        color: isSelected
                            ? Colors.blue.shade700
                            : Colors.grey.shade600,
                      ),
                      title: Text(
                        widgetInfo.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: isSelected
                              ? Colors.blue.shade700
                              : Colors.black87,
                        ),
                      ),
                      selected: isSelected,
                      selectedTileColor: Colors.blue.shade50,
                      onTap: () => onSelected(index),
                    ),
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
