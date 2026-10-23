import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class ImagePreview extends StatelessWidget {
  final ImageParams params;

  const ImagePreview({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: params.width,
      height: params.height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(params.borderRadius),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Image.network(
        'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?w=400&auto=format&fit=crop&q=80',
        width: params.width,
        height: params.height,
        fit: params.fit,
        alignment: params.alignment,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 40),
                const SizedBox(height: 6),
                Text(
                  'Flutter Image Asset',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        },
      ),
    );
  }
}
