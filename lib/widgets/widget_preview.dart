import 'package:flutter/material.dart';

import 'previews/card_preview.dart';
import 'previews/column_preview.dart';
import 'previews/container_preview.dart';
import 'previews/elevated_button_preview.dart';
import 'previews/grid_view_preview.dart';
import 'previews/icon_preview.dart';
import 'previews/image_preview.dart';
import 'previews/list_view_preview.dart';
import 'previews/row_preview.dart';
import 'previews/stack_preview.dart';
import 'previews/text_field_preview.dart';
import 'previews/text_preview.dart';
import 'previews/wrap_preview.dart';

class WidgetPreview extends StatelessWidget {
  final String widgetName;

  const WidgetPreview({super.key, required this.widgetName});

  @override
  Widget build(BuildContext context) {
    switch (widgetName) {
      case 'Text':
        return const TextPreview();
      case 'Container':
        return const ContainerPreview();
      case 'Row':
        return const RowPreview();
      case 'Column':
        return const ColumnPreview();
      case 'Stack':
        return const StackPreview();
      case 'Card':
        return const CardPreview();
      case 'Icon':
        return const IconPreview();
      case 'Image':
        return const ImagePreview();
      case 'ElevatedButton':
        return const ElevatedButtonPreview();
      case 'TextField':
        return const TextFieldPreview();
      case 'ListView':
        return const ListViewPreview();
      case 'GridView':
        return const GridViewPreview();
      case 'Wrap':
        return const WrapPreview();
      default:
        return const Center(child: Text('Preview not available'));
    }
  }
}
