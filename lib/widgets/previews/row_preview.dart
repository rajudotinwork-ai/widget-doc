import 'package:flutter/material.dart';

class RowPreview extends StatelessWidget {
  const RowPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.amber),
          SizedBox(width: 8),
          Text('Star 1', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(width: 24),
          Icon(Icons.favorite, color: Colors.redAccent),
          SizedBox(width: 8),
          Text('Heart 2', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(width: 24),
          Icon(Icons.thumb_up, color: Colors.blue),
          SizedBox(width: 8),
          Text('Like 3', style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
