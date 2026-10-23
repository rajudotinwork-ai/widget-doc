import 'package:flutter/material.dart';

import '../../models/widget_params.dart';

class TextFieldPreview extends StatefulWidget {
  final TextFieldParams params;

  const TextFieldPreview({super.key, required this.params});

  @override
  State<TextFieldPreview> createState() => _TextFieldPreviewState();
}

class _TextFieldPreviewState extends State<TextFieldPreview> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prefixIconData = TextFieldParams.getPrefixIcon(
      widget.params.prefixIcon,
    );

    InputBorder border;
    if (widget.params.borderType == 'underline') {
      border = const UnderlineInputBorder();
    } else if (widget.params.borderType == 'none') {
      border = InputBorder.none;
    } else {
      border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.params.borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade400),
      );
    }

    return SizedBox(
      width: 300,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.params.enabled,
        obscureText: widget.params.obscureText,
        decoration: InputDecoration(
          labelText: widget.params.labelText,
          hintText: widget.params.hintText,
          prefixIcon: prefixIconData != null
              ? Icon(prefixIconData, color: Colors.blue)
              : null,
          filled: widget.params.filled,
          fillColor: widget.params.fillColor,
          border: border,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
