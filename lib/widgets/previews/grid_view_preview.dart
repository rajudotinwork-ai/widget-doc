import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class GridViewPreview extends StatelessWidget {
  final GridViewParams params;

  const GridViewPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue.shade100,
      Colors.teal.shade100,
      Colors.amber.shade100,
      Colors.purple.shade100,
      Colors.pink.shade100,
      Colors.orange.shade100,
      Colors.cyan.shade100,
      Colors.green.shade100,
    ];
    final icons = [
      Icons.analytics,
      Icons.bolt,
      Icons.eco,
      Icons.extension,
      Icons.favorite,
      Icons.star,
      Icons.palette,
      Icons.explore,
    ];

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 360, maxHeight: 180),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: GridView.count(
        crossAxisCount: params.crossAxisCount,
        scrollDirection: params.scrollDirection,
        mainAxisSpacing: params.mainAxisSpacing,
        crossAxisSpacing: params.crossAxisSpacing,
        childAspectRatio: params.childAspectRatio,
        children: List.generate(params.itemCount, (index) {
          final color = colors[index % colors.length];
          final icon = icons[index % icons.length];
          return Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 18, color: Colors.black87),
                const SizedBox(width: 6),
                Text(
                  'Item ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
