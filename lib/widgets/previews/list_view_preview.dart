import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class ListViewPreview extends StatelessWidget {
  final ListViewParams params;

  const ListViewPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final isHorizontal = params.scrollDirection == Axis.horizontal;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 360,
        maxHeight: isHorizontal ? 120 : 180,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListView.separated(
        scrollDirection: params.scrollDirection,
        reverse: params.reverse,
        padding: const EdgeInsets.all(8),
        itemCount: params.itemCount,
        separatorBuilder: (context, index) => SizedBox(
          width: isHorizontal ? params.itemSpacing : 0,
          height: isHorizontal ? 0 : params.itemSpacing,
        ),
        itemBuilder: (context, index) {
          final itemNumber = index + 1;
          if (isHorizontal) {
            return Container(
              width: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 16, child: Text('$itemNumber')),
                  const SizedBox(height: 6),
                  Text(
                    'Card $itemNumber',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }

          return Material(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            child: ListTile(
              dense: true,
              leading: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue,
                child: Text(
                  '$itemNumber',
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              title: Text(
                'List Entry $itemNumber',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              subtitle: const Text(
                'Tap to inspect',
                style: TextStyle(fontSize: 11),
              ),
              trailing: const Icon(Icons.chevron_right, size: 18),
            ),
          );
        },
      ),
    );
  }
}
