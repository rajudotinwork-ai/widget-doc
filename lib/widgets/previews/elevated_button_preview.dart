import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class ElevatedButtonPreview extends StatelessWidget {
  final ElevatedButtonParams params;

  const ElevatedButtonPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: params.backgroundColor,
      foregroundColor: params.foregroundColor,
      elevation: params.elevation,
      padding: EdgeInsets.symmetric(
        horizontal: params.paddingH,
        vertical: params.paddingV,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(params.borderRadius),
      ),
    );

    final voidCallback = params.enabled
        ? () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tapped: ${params.text}!'),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        : null;

    if (params.showIcon) {
      return ElevatedButton.icon(
        onPressed: voidCallback,
        icon: const Icon(Icons.send_rounded, size: 18),
        label: Text(params.text),
        style: style,
      );
    } else {
      return ElevatedButton(
        onPressed: voidCallback,
        style: style,
        child: Text(params.text),
      );
    }
  }
}
