import 'package:flutter/material.dart';

class WrapPreview extends StatelessWidget {
  const WrapPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = [
      'Flutter',
      'Dart',
      'Widgets',
      'Web',
      'Mobile',
      'UI/UX',
      'Responsive',
    ];

    return Container(
      width: 280,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: tags.map((tag) {
          return Chip(
            avatar: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 10,
              child: Text(
                '#',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
            label: Text(tag, style: const TextStyle(fontSize: 12)),
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.grey.shade300),
          );
        }).toList(),
      ),
    );
  }
}
