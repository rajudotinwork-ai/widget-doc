import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class TextPreview extends StatelessWidget {
  final TextParams params;

  const TextPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(16),
      child: Text(
        params.text,
        textAlign: params.textAlign,
        maxLines: params.maxLines,
        overflow: params.overflow,
        style: TextStyle(
          fontSize: params.fontSize,
          fontWeight: params.fontWeight,
          color: params.color,
          letterSpacing: params.letterSpacing,
          fontStyle: params.isItalic ? FontStyle.italic : FontStyle.normal,
        ),
      ),
    );
  }
}
