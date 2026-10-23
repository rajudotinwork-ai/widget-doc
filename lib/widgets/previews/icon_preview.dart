import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class IconPreview extends StatelessWidget {
  final IconParams params;

  const IconPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconParams.getIconData(params.iconName),
            size: params.size,
            color: params.color,
            semanticLabel: params.semanticLabel,
          ),
          const SizedBox(height: 8),
          Text(
            params.semanticLabel,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
