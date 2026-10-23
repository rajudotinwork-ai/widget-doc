import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class RowPreview extends StatelessWidget {
  final RowParams params;

  const RowPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final sampleIcons = [
      Icons.star,
      Icons.favorite,
      Icons.thumb_up,
      Icons.bookmark,
      Icons.eco,
    ];
    final sampleColors = [
      Colors.amber,
      Colors.redAccent,
      Colors.blue,
      Colors.purple,
      Colors.green,
    ];

    final children = <Widget>[];
    for (int i = 0; i < params.itemCount; i++) {
      if (i > 0 && params.spacing > 0) {
        children.add(SizedBox(width: params.spacing));
      }
      children.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              sampleIcons[i % sampleIcons.length],
              color: sampleColors[i % sampleColors.length],
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              'Item ${i + 1}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 420, minHeight: 60),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        mainAxisAlignment: params.mainAxisAlignment,
        crossAxisAlignment: params.crossAxisAlignment,
        mainAxisSize: params.mainAxisSize,
        children: children,
      ),
    );
  }
}
