import 'package:flutter/material.dart';

class GridViewPreview extends StatelessWidget {
  const GridViewPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue.shade100,
      Colors.teal.shade100,
      Colors.amber.shade100,
      Colors.purple.shade100,
    ];
    final labels = ['Alpha', 'Beta', 'Gamma', 'Delta'];
    final icons = [Icons.analytics, Icons.bolt, Icons.eco, Icons.extension];

    return SizedBox(
      width: 260,
      height: 150,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.6,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(4, (index) {
          return Container(
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icons[index], size: 20, color: Colors.black87),
                const SizedBox(width: 6),
                Text(
                  labels[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
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
