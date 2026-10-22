import 'package:flutter/material.dart';

class TextFieldPreview extends StatelessWidget {
  const TextFieldPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search Widgets',
          hintText: 'Enter keyword...',
          prefixIcon: const Icon(Icons.search, color: Colors.blue),
          suffixIcon: const Icon(Icons.clear, size: 18),
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
