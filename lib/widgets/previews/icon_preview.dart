import 'package:flutter/material.dart';

class IconPreview extends StatelessWidget {
  const IconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home_rounded, color: Colors.blue, size: 36),
          SizedBox(width: 20),
          Icon(Icons.favorite_rounded, color: Colors.pink, size: 36),
          SizedBox(width: 20),
          Icon(Icons.star_rounded, color: Colors.amber, size: 36),
          SizedBox(width: 20),
          Icon(Icons.settings_rounded, color: Colors.teal, size: 36),
          SizedBox(width: 20),
          Icon(
            Icons.notifications_active_rounded,
            color: Colors.deepPurple,
            size: 36,
          ),
        ],
      ),
    );
  }
}
