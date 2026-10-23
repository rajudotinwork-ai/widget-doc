import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class StackPreview extends StatelessWidget {
  final StackParams params;

  const StackPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 130,
      child: Stack(
        alignment: params.alignment,
        children: [
          Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Base Layer',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          if (params.showBadge)
            Positioned(
              top: params.top,
              right: params.right,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: params.badgeColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          if (params.showOverlayText)
            const Positioned(
              bottom: 8,
              left: 12,
              child: Row(
                children: [
                  Icon(Icons.layers, color: Colors.white70, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'Stacked Badge',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
