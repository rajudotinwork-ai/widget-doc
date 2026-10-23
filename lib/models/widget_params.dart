import 'package:flutter/material.dart';

String colorToCode(Color color) {
  if (color == Colors.blue) {
    return 'Colors.blue';
  }
  if (color == Colors.indigo) {
    return 'Colors.indigo';
  }
  if (color == Colors.purple) {
    return 'Colors.purple';
  }
  if (color == Colors.deepPurpleAccent) {
    return 'Colors.deepPurpleAccent';
  }
  if (color == Colors.red || color == Colors.redAccent) {
    return 'Colors.red';
  }
  if (color == Colors.pink) {
    return 'Colors.pink';
  }
  if (color == Colors.teal) {
    return 'Colors.teal';
  }
  if (color == Colors.green) {
    return 'Colors.green';
  }
  if (color == Colors.amber) {
    return 'Colors.amber';
  }
  if (color == Colors.orange) {
    return 'Colors.orange';
  }
  if (color == Colors.white) {
    return 'Colors.white';
  }
  if (color == Colors.black || color == Colors.black87) {
    return 'Colors.black87';
  }
  if (color == Colors.grey || color == Colors.grey.shade100) {
    return 'Colors.grey.shade100';
  }
  return 'const Color(0x${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()})';
}

final List<Color> commonPalette = [
  Colors.blue,
  Colors.indigo,
  Colors.teal,
  Colors.green,
  Colors.amber,
  Colors.orange,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.black87,
  Colors.white,
];

// Base class for widget parameters
abstract class WidgetParams {
  void reset();
  String toCode();
}

// 1. TextParams
class TextParams extends WidgetParams {
  String text;
  double fontSize;
  Color color;
  FontWeight fontWeight;
  TextAlign textAlign;
  double letterSpacing;
  int maxLines;
  TextOverflow overflow;
  bool isItalic;

  TextParams({
    this.text = 'Hello, Flutter!',
    this.fontSize = 24.0,
    this.color = Colors.blue,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
    this.letterSpacing = 1.0,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
    this.isItalic = false,
  });

  @override
  void reset() {
    text = 'Hello, Flutter!';
    fontSize = 24.0;
    color = Colors.blue;
    fontWeight = FontWeight.bold;
    textAlign = TextAlign.center;
    letterSpacing = 1.0;
    maxLines = 2;
    overflow = TextOverflow.ellipsis;
    isItalic = false;
  }

  @override
  String toCode() {
    final styleParts = <String>[
      'fontSize: ${fontSize.toStringAsFixed(1)}',
      'fontWeight: FontWeight.${fontWeight.toString().split('.').last}',
      'color: ${colorToCode(color)}',
      'letterSpacing: ${letterSpacing.toStringAsFixed(1)}',
    ];
    if (isItalic) {
      styleParts.add('fontStyle: FontStyle.italic');
    }

    return '''Text(
  '$text',
  textAlign: TextAlign.${textAlign.name},
  maxLines: $maxLines,
  overflow: TextOverflow.${overflow.name},
  style: TextStyle(
    ${styleParts.join(',\n    ')},
  ),
)''';
  }
}

// 2. ContainerParams
class ContainerParams extends WidgetParams {
  double width;
  double height;
  Color color;
  double padding;
  double margin;
  double borderRadius;
  double borderWidth;
  Color borderColor;
  Alignment alignment;
  bool hasShadow;
  bool hasGradient;
  Color gradientEndColor;

  ContainerParams({
    this.width = 180.0,
    this.height = 110.0,
    this.color = Colors.blue,
    this.padding = 16.0,
    this.margin = 8.0,
    this.borderRadius = 16.0,
    this.borderWidth = 0.0,
    this.borderColor = Colors.indigo,
    this.alignment = Alignment.center,
    this.hasShadow = true,
    this.hasGradient = true,
    this.gradientEndColor = Colors.indigo,
  });

  @override
  void reset() {
    width = 180.0;
    height = 110.0;
    color = Colors.blue;
    padding = 16.0;
    margin = 8.0;
    borderRadius = 16.0;
    borderWidth = 0.0;
    borderColor = Colors.indigo;
    alignment = Alignment.center;
    hasShadow = true;
    hasGradient = true;
    gradientEndColor = Colors.indigo;
  }

  @override
  String toCode() {
    final decorationParts = <String>[];
    if (hasGradient) {
      decorationParts.add(
        'gradient: const LinearGradient(\n'
        '      colors: [${colorToCode(color)}, ${colorToCode(gradientEndColor)}],\n'
        '    )',
      );
    } else {
      decorationParts.add('color: ${colorToCode(color)}');
    }

    if (borderRadius > 0) {
      decorationParts.add(
        'borderRadius: BorderRadius.circular(${borderRadius.toStringAsFixed(0)})',
      );
    }

    if (borderWidth > 0) {
      decorationParts.add(
        'border: Border.all(color: ${colorToCode(borderColor)}, width: ${borderWidth.toStringAsFixed(1)})',
      );
    }

    if (hasShadow) {
      decorationParts.add(
        'boxShadow: const [\n'
        '      BoxShadow(\n'
        '        color: Colors.black26,\n'
        '        blurRadius: 10,\n'
        '        offset: Offset(0, 4),\n'
        '      ),\n'
        '    ]',
      );
    }

    return '''Container(
  width: ${width.toStringAsFixed(0)},
  height: ${height.toStringAsFixed(0)},
  margin: const EdgeInsets.all(${margin.toStringAsFixed(0)}),
  padding: const EdgeInsets.all(${padding.toStringAsFixed(0)}),
  alignment: Alignment.${alignment.toString().split('.').last},
  decoration: BoxDecoration(
    ${decorationParts.join(',\n    ')},
  ),
  child: const Text(
    'Styled Container',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
)''';
  }
}

// 3. RowParams
class RowParams extends WidgetParams {
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisSize mainAxisSize;
  double spacing;
  int itemCount;

  RowParams({
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.spacing = 8.0,
    this.itemCount = 3,
  });

  @override
  void reset() {
    mainAxisAlignment = MainAxisAlignment.spaceEvenly;
    crossAxisAlignment = CrossAxisAlignment.center;
    mainAxisSize = MainAxisSize.max;
    spacing = 8.0;
    itemCount = 3;
  }

  @override
  String toCode() {
    return '''Row(
  mainAxisAlignment: MainAxisAlignment.${mainAxisAlignment.name},
  crossAxisAlignment: CrossAxisAlignment.${crossAxisAlignment.name},
  mainAxisSize: MainAxisSize.${mainAxisSize.name},
  children: const [
    // $itemCount items (spacing: ${spacing.toStringAsFixed(0)})
    Icon(Icons.star, color: Colors.amber),
    SizedBox(width: ${spacing.toStringAsFixed(0)}),
    Text('Item 1'),
    SizedBox(width: ${spacing.toStringAsFixed(0)}),
    Icon(Icons.favorite, color: Colors.redAccent),
    SizedBox(width: ${spacing.toStringAsFixed(0)}),
    Text('Item 2'),
  ],
)''';
  }
}

// 4. ColumnParams
class ColumnParams extends WidgetParams {
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisSize mainAxisSize;
  double spacing;
  int itemCount;

  ColumnParams({
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.spacing = 8.0,
    this.itemCount = 3,
  });

  @override
  void reset() {
    mainAxisAlignment = MainAxisAlignment.center;
    crossAxisAlignment = CrossAxisAlignment.center;
    mainAxisSize = MainAxisSize.min;
    spacing = 8.0;
    itemCount = 3;
  }

  @override
  String toCode() {
    return '''Column(
  mainAxisAlignment: MainAxisAlignment.${mainAxisAlignment.name},
  crossAxisAlignment: CrossAxisAlignment.${crossAxisAlignment.name},
  mainAxisSize: MainAxisSize.${mainAxisSize.name},
  children: const [
    CircleAvatar(radius: 24, child: Icon(Icons.person)),
    SizedBox(height: ${spacing.toStringAsFixed(0)}),
    Text('Alex Morgan', style: TextStyle(fontWeight: FontWeight.bold)),
    SizedBox(height: ${spacing.toStringAsFixed(0)}),
    Text('Flutter Developer', style: TextStyle(color: Colors.grey)),
  ],
)''';
  }
}

// 5. StackParams
class StackParams extends WidgetParams {
  Alignment alignment;
  double top;
  double right;
  bool showBadge;
  bool showOverlayText;
  Color badgeColor;

  StackParams({
    this.alignment = Alignment.center,
    this.top = 10.0,
    this.right = 10.0,
    this.showBadge = true,
    this.showOverlayText = true,
    this.badgeColor = Colors.amber,
  });

  @override
  void reset() {
    alignment = Alignment.center;
    top = 10.0;
    right = 10.0;
    showBadge = true;
    showOverlayText = true;
    badgeColor = Colors.amber;
  }

  @override
  String toCode() {
    return '''Stack(
  alignment: Alignment.${alignment.toString().split('.').last},
  children: [
    Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Base Layer', style: TextStyle(color: Colors.white)),
      ),
    ),
    ${showBadge ? '''Positioned(
      top: ${top.toStringAsFixed(0)},
      right: ${right.toStringAsFixed(0)},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: ${colorToCode(badgeColor)},
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text('NEW', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ),''' : ''}
  ],
)''';
  }
}

// 6. CardParams
class CardParams extends WidgetParams {
  Color color;
  double elevation;
  double borderRadius;
  double padding;
  double margin;

  CardParams({
    this.color = Colors.white,
    this.elevation = 4.0,
    this.borderRadius = 16.0,
    this.padding = 16.0,
    this.margin = 12.0,
  });

  @override
  void reset() {
    color = Colors.white;
    elevation = 4.0;
    borderRadius = 16.0;
    padding = 16.0;
    margin = 12.0;
  }

  @override
  String toCode() {
    return '''Card(
  color: ${colorToCode(color)},
  elevation: ${elevation.toStringAsFixed(1)},
  margin: const EdgeInsets.all(${margin.toStringAsFixed(0)}),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(${borderRadius.toStringAsFixed(0)}),
  ),
  child: Padding(
    padding: const EdgeInsets.all(${padding.toStringAsFixed(0)}),
    child: const Text('Material Card Content'),
  ),
)''';
  }
}

// 7. IconParams
class IconParams extends WidgetParams {
  String iconName;
  double size;
  Color color;
  String semanticLabel;

  IconParams({
    this.iconName = 'favorite',
    this.size = 48.0,
    this.color = Colors.pink,
    this.semanticLabel = 'Favorite Icon',
  });

  @override
  void reset() {
    iconName = 'favorite';
    size = 48.0;
    color = Colors.pink;
    semanticLabel = 'Favorite Icon';
  }

  static IconData getIconData(String name) {
    switch (name) {
      case 'home':
        return Icons.home_rounded;
      case 'star':
        return Icons.star_rounded;
      case 'settings':
        return Icons.settings_rounded;
      case 'person':
        return Icons.person_rounded;
      case 'notifications':
        return Icons.notifications_active_rounded;
      case 'favorite':
      default:
        return Icons.favorite_rounded;
    }
  }

  @override
  String toCode() {
    return '''Icon(
  Icons.${iconName}_rounded,
  size: ${size.toStringAsFixed(1)},
  color: ${colorToCode(color)},
  semanticLabel: '$semanticLabel',
)''';
  }
}

// 8. ImageParams
class ImageParams extends WidgetParams {
  double width;
  double height;
  BoxFit fit;
  double borderRadius;
  Alignment alignment;

  ImageParams({
    this.width = 220.0,
    this.height = 130.0,
    this.fit = BoxFit.cover,
    this.borderRadius = 14.0,
    this.alignment = Alignment.center,
  });

  @override
  void reset() {
    width = 220.0;
    height = 130.0;
    fit = BoxFit.cover;
    borderRadius = 14.0;
    alignment = Alignment.center;
  }

  @override
  String toCode() {
    return '''ClipRRect(
  borderRadius: BorderRadius.circular(${borderRadius.toStringAsFixed(0)}),
  child: Image.network(
    'https://picsum.photos/400/250',
    width: ${width.toStringAsFixed(0)},
    height: ${height.toStringAsFixed(0)},
    fit: BoxFit.${fit.name},
    alignment: Alignment.${alignment.toString().split('.').last},
    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
  ),
)''';
  }
}

// 9. ElevatedButtonParams
class ElevatedButtonParams extends WidgetParams {
  String text;
  Color backgroundColor;
  Color foregroundColor;
  double elevation;
  double borderRadius;
  double paddingH;
  double paddingV;
  bool enabled;
  bool showIcon;

  ElevatedButtonParams({
    this.text = 'Click Me',
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.elevation = 3.0,
    this.borderRadius = 10.0,
    this.paddingH = 20.0,
    this.paddingV = 12.0,
    this.enabled = true,
    this.showIcon = true,
  });

  @override
  void reset() {
    text = 'Click Me';
    backgroundColor = Colors.blue;
    foregroundColor = Colors.white;
    elevation = 3.0;
    borderRadius = 10.0;
    paddingH = 20.0;
    paddingV = 12.0;
    enabled = true;
    showIcon = true;
  }

  @override
  String toCode() {
    final styleCode =
        '''style: ElevatedButton.styleFrom(
    backgroundColor: ${colorToCode(backgroundColor)},
    foregroundColor: ${colorToCode(foregroundColor)},
    elevation: ${elevation.toStringAsFixed(1)},
    padding: const EdgeInsets.symmetric(
      horizontal: ${paddingH.toStringAsFixed(0)},
      vertical: ${paddingV.toStringAsFixed(0)},
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(${borderRadius.toStringAsFixed(0)}),
    ),
  )''';

    if (showIcon) {
      return '''ElevatedButton.icon(
  onPressed: ${enabled ? '() { print("Button Pressed!"); }' : 'null'},
  icon: const Icon(Icons.send_rounded, size: 18),
  label: Text('$text'),
  $styleCode,
)''';
    } else {
      return '''ElevatedButton(
  onPressed: ${enabled ? '() { print("Button Pressed!"); }' : 'null'},
  $styleCode,
  child: Text('$text'),
)''';
    }
  }
}

// 10. TextFieldParams
class TextFieldParams extends WidgetParams {
  String labelText;
  String hintText;
  bool filled;
  Color fillColor;
  double borderRadius;
  bool enabled;
  bool obscureText;
  String prefixIcon;
  String borderType;

  TextFieldParams({
    this.labelText = 'Username',
    this.hintText = 'Enter your username',
    this.filled = true,
    this.fillColor = Colors.white,
    this.borderRadius = 12.0,
    this.enabled = true,
    this.obscureText = false,
    this.prefixIcon = 'person',
    this.borderType = 'outline',
  });

  @override
  void reset() {
    labelText = 'Username';
    hintText = 'Enter your username';
    filled = true;
    fillColor = Colors.white;
    borderRadius = 12.0;
    enabled = true;
    obscureText = false;
    prefixIcon = 'person';
    borderType = 'outline';
  }

  static IconData? getPrefixIcon(String icon) {
    switch (icon) {
      case 'person':
        return Icons.person_outline;
      case 'email':
        return Icons.email_outlined;
      case 'lock':
        return Icons.lock_outline;
      case 'search':
        return Icons.search;
      default:
        return null;
    }
  }

  @override
  String toCode() {
    final prefixCode = prefixIcon != 'none'
        ? 'prefixIcon: const Icon(Icons.${prefixIcon}_outline),\n    '
        : '';

    final borderCode = borderType == 'underline'
        ? 'border: const UnderlineInputBorder(),'
        : borderType == 'none'
        ? 'border: InputBorder.none,'
        : 'border: OutlineInputBorder(borderRadius: BorderRadius.circular(${borderRadius.toStringAsFixed(0)})),';

    return '''TextField(
  enabled: $enabled,
  obscureText: $obscureText,
  decoration: InputDecoration(
    labelText: '$labelText',
    hintText: '$hintText',
    $prefixCode'filled: $filled,
    fillColor: ${colorToCode(fillColor)},
    $borderCode
  ),
)''';
  }
}

// 11. ListViewParams
class ListViewParams extends WidgetParams {
  Axis scrollDirection;
  int itemCount;
  double itemSpacing;
  bool reverse;

  ListViewParams({
    this.scrollDirection = Axis.vertical,
    this.itemCount = 5,
    this.itemSpacing = 8.0,
    this.reverse = false,
  });

  @override
  void reset() {
    scrollDirection = Axis.vertical;
    itemCount = 5;
    itemSpacing = 8.0;
    reverse = false;
  }

  @override
  String toCode() {
    return '''SizedBox(
  height: 180,
  child: ListView.separated(
    scrollDirection: Axis.${scrollDirection.name},
    reverse: $reverse,
    itemCount: $itemCount,
    separatorBuilder: (context, index) => SizedBox(
      width: ${scrollDirection == Axis.horizontal ? itemSpacing.toStringAsFixed(0) : 0},
      height: ${scrollDirection == Axis.vertical ? itemSpacing.toStringAsFixed(0) : 0},
    ),
    itemBuilder: (context, index) => ListTile(
      leading: CircleAvatar(child: Text('\${index + 1}')),
      title: Text('List Item \${index + 1}'),
      subtitle: const Text('Tap to inspect item'),
    ),
  ),
)''';
  }
}

// 12. GridViewParams
class GridViewParams extends WidgetParams {
  int crossAxisCount;
  int itemCount;
  double mainAxisSpacing;
  double crossAxisSpacing;
  double childAspectRatio;
  Axis scrollDirection;

  GridViewParams({
    this.crossAxisCount = 2,
    this.itemCount = 6,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
    this.childAspectRatio = 1.4,
    this.scrollDirection = Axis.vertical,
  });

  @override
  void reset() {
    crossAxisCount = 2;
    itemCount = 6;
    mainAxisSpacing = 8.0;
    crossAxisSpacing = 8.0;
    childAspectRatio = 1.4;
    scrollDirection = Axis.vertical;
  }

  @override
  String toCode() {
    return '''SizedBox(
  height: 180,
  child: GridView.count(
    crossAxisCount: $crossAxisCount,
    scrollDirection: Axis.${scrollDirection.name},
    mainAxisSpacing: ${mainAxisSpacing.toStringAsFixed(0)},
    crossAxisSpacing: ${crossAxisSpacing.toStringAsFixed(0)},
    childAspectRatio: ${childAspectRatio.toStringAsFixed(1)},
    children: List.generate(
      $itemCount,
      (index) => Container(
        color: Colors.blue.shade100,
        alignment: Alignment.center,
        child: Text('Grid item \$index'),
      ),
    ),
  ),
)''';
  }
}

// 13. WrapParams
class WrapParams extends WidgetParams {
  Axis direction;
  WrapAlignment alignment;
  double spacing;
  double runSpacing;
  WrapAlignment runAlignment;
  int chipCount;

  WrapParams({
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
    this.runAlignment = WrapAlignment.start,
    this.chipCount = 7,
  });

  @override
  void reset() {
    direction = Axis.horizontal;
    alignment = WrapAlignment.start;
    spacing = 8.0;
    runSpacing = 8.0;
    runAlignment = WrapAlignment.start;
    chipCount = 7;
  }

  @override
  String toCode() {
    return '''Wrap(
  direction: Axis.${direction.name},
  alignment: WrapAlignment.${alignment.name},
  spacing: ${spacing.toStringAsFixed(1)},
  runSpacing: ${runSpacing.toStringAsFixed(1)},
  runAlignment: WrapAlignment.${runAlignment.name},
  children: const [
    // $chipCount sample chips
    Chip(label: Text('Flutter')),
    Chip(label: Text('Dart')),
    Chip(label: Text('Widgets')),
    Chip(label: Text('Responsive')),
  ],
)''';
  }
}

// Master state holder for all widget parameters
class AppWidgetParams {
  final TextParams text = TextParams();
  final ContainerParams container = ContainerParams();
  final RowParams row = RowParams();
  final ColumnParams column = ColumnParams();
  final StackParams stack = StackParams();
  final CardParams card = CardParams();
  final IconParams icon = IconParams();
  final ImageParams image = ImageParams();
  final ElevatedButtonParams elevatedButton = ElevatedButtonParams();
  final TextFieldParams textField = TextFieldParams();
  final ListViewParams listView = ListViewParams();
  final GridViewParams gridView = GridViewParams();
  final WrapParams wrap = WrapParams();

  WidgetParams getParamsFor(String widgetName) {
    switch (widgetName) {
      case 'Text':
        return text;
      case 'Container':
        return container;
      case 'Row':
        return row;
      case 'Column':
        return column;
      case 'Stack':
        return stack;
      case 'Card':
        return card;
      case 'Icon':
        return icon;
      case 'Image':
        return image;
      case 'ElevatedButton':
        return elevatedButton;
      case 'TextField':
        return textField;
      case 'ListView':
        return listView;
      case 'GridView':
        return gridView;
      case 'Wrap':
        return wrap;
      default:
        return text;
    }
  }
}
