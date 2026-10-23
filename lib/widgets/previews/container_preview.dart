import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class ContainerPreview extends StatelessWidget {
  final ContainerParams params;

  const ContainerPreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: params.width,
      height: params.height,
      margin: EdgeInsets.all(params.margin),
      padding: EdgeInsets.all(params.padding),
      alignment: params.alignment,
      decoration: BoxDecoration(
        color: params.hasGradient ? null : params.color,
        gradient: params.hasGradient
            ? LinearGradient(
                colors: [params.color, params.gradientEndColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(params.borderRadius),
        border: params.borderWidth > 0
            ? Border.all(color: params.borderColor, width: params.borderWidth)
            : null,
        boxShadow: params.hasShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: const Text(
        'Container Child',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
