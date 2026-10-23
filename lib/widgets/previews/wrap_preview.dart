import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class WrapPreview extends StatelessWidget {
  final WrapParams params;

  const WrapPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final allTags = [
      'Flutter',
      'Dart',
      'Widgets',
      'Web',
      'Mobile',
      'UI/UX',
      'Responsive',
      'Layout',
      'Design',
      'CrossPlatform',
      'Reactive',
      'Material',
    ];

    final tags = allTags.take(params.chipCount).toList();

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 380, minHeight: 120),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Wrap(
        direction: params.direction,
        alignment: params.alignment,
        spacing: params.spacing,
        runSpacing: params.runSpacing,
        runAlignment: params.runAlignment,
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
