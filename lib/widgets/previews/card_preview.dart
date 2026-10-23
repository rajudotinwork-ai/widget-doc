import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class CardPreview extends StatelessWidget {
  final CardParams params;

  const CardPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: params.color,
      elevation: params.elevation,
      margin: EdgeInsets.all(params.margin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(params.borderRadius),
      ),
      child: Container(
        width: 280,
        padding: EdgeInsets.all(params.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.dashboard_customize,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Material Card',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Elevated surface',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Cards present grouped information with customizable elevation and rounded borders.',
              style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
