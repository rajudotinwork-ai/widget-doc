import 'package:flutter/material.dart';

import '../models/widget_params.dart';
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
  final AppWidgetParams appParams;

  const WidgetPreview({
    super.key,
    required this.widgetName,
    required this.appParams,
  });

  @override
  Widget build(BuildContext context) {
    switch (widgetName) {
      case 'Text':
        return TextPreview(params: appParams.text);
      case 'Container':
        return ContainerPreview(params: appParams.container);
      case 'Row':
        return RowPreview(params: appParams.row);
      case 'Column':
        return ColumnPreview(params: appParams.column);
      case 'Stack':
        return StackPreview(params: appParams.stack);
      case 'Card':
        return CardPreview(params: appParams.card);
      case 'Icon':
        return IconPreview(params: appParams.icon);
      case 'Image':
        return ImagePreview(params: appParams.image);
      case 'ElevatedButton':
        return ElevatedButtonPreview(params: appParams.elevatedButton);
      case 'TextField':
        return TextFieldPreview(params: appParams.textField);
      case 'ListView':
        return ListViewPreview(params: appParams.listView);
      case 'GridView':
        return GridViewPreview(params: appParams.gridView);
      case 'Wrap':
        return WrapPreview(params: appParams.wrap);
      default:
        return const Center(child: Text('Preview not available'));
    }
  }
}
