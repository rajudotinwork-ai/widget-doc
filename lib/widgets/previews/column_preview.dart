import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class ColumnPreview extends StatelessWidget {
  final ColumnParams params;

  const ColumnPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final sampleWidgets = <Widget>[
      const CircleAvatar(
        radius: 22,
        backgroundColor: Colors.blue,
        child: Icon(Icons.person, color: Colors.white, size: 24),
      ),
      const Text(
        'Alex Morgan',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const Text(
        'Flutter Developer',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.green.shade200),
        ),
        child: const Text(
          'Status: Active',
          style: TextStyle(fontSize: 11, color: Colors.green),
        ),
      ),
    ];

    final children = <Widget>[];
    final count = params.itemCount.clamp(1, sampleWidgets.length);
    for (int i = 0; i < count; i++) {
      if (i > 0 && params.spacing > 0) {
        children.add(SizedBox(height: params.spacing));
      }
      children.add(sampleWidgets[i]);
    }

    return Container(
      width: 260,
      constraints: const BoxConstraints(minHeight: 140),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: params.mainAxisAlignment,
        crossAxisAlignment: params.crossAxisAlignment,
        mainAxisSize: params.mainAxisSize,
        children: children,
      ),
    );
  }
}
