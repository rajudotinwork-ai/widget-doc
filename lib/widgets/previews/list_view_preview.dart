import 'package:flutter/material.dart';

class ListViewPreview extends StatelessWidget {
  const ListViewPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Item One',
        'subtitle': 'First scrollable entry',
        'icon': Icons.folder,
      },
      {
        'title': 'Item Two',
        'subtitle': 'Second scrollable entry',
        'icon': Icons.description,
      },
      {
        'title': 'Item Three',
        'subtitle': 'Third scrollable entry',
        'icon': Icons.image,
      },
      {
        'title': 'Item Four',
        'subtitle': 'Fourth scrollable entry',
        'icon': Icons.videocam,
      },
    ];

    return Container(
      width: 280,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            dense: true,
            leading: Icon(
              item['icon'] as IconData,
              color: Colors.blue,
              size: 20,
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            subtitle: Text(
              item['subtitle'] as String,
              style: const TextStyle(fontSize: 11),
            ),
          );
        },
      ),
    );
  }
}
