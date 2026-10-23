import 'package:flutter/material.dart';

import '../../models/widget_params.dart';
import 'control_widgets.dart';

class WidgetParameterPanel extends StatelessWidget {
  final String widgetName;
  final AppWidgetParams appParams;
  final VoidCallback onChanged;

  const WidgetParameterPanel({
    super.key,
    required this.widgetName,
    required this.appParams,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Reset button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.tune_rounded,
                      color: Colors.blue.shade700,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '$widgetName Parameters',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              OutlinedButton.icon(
                onPressed: () {
                  appParams.getParamsFor(widgetName).reset();
                  onChanged();
                },
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Reset to Defaults'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey.shade800,
                  side: BorderSide(color: Colors.grey.shade400),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),

          // Widget-specific controls
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildControls() {
    switch (widgetName) {
      case 'Text':
        return _buildTextControls();
      case 'Container':
        return _buildContainerControls();
      case 'Row':
        return _buildRowControls();
      case 'Column':
        return _buildColumnControls();
      case 'Stack':
        return _buildStackControls();
      case 'Card':
        return _buildCardControls();
      case 'Icon':
        return _buildIconControls();
      case 'Image':
        return _buildImageControls();
      case 'ElevatedButton':
        return _buildElevatedButtonControls();
      case 'TextField':
        return _buildTextFieldControls();
      case 'ListView':
        return _buildListViewControls();
      case 'GridView':
        return _buildGridViewControls();
      case 'Wrap':
        return _buildWrapControls();
      default:
        return const Text('No customizable parameters for this widget.');
    }
  }

  Widget _buildTextControls() {
    final p = appParams.text;
    return Column(
      children: [
        ControlTextField(
          label: 'Text Content',
          initialValue: p.text,
          onChanged: (val) {
            p.text = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Font Size',
          value: p.fontSize,
          min: 12,
          max: 42,
          unit: 'px',
          onChanged: (val) {
            p.fontSize = val;
            onChanged();
          },
        ),
        ControlColorPicker(
          label: 'Text Color',
          selectedColor: p.color,
          onColorChanged: (c) {
            p.color = c;
            onChanged();
          },
        ),
        ControlDropdown<FontWeight>(
          label: 'Font Weight',
          value: p.fontWeight,
          items: const [
            DropdownMenuItem(
              value: FontWeight.w300,
              child: Text('Light (w300)'),
            ),
            DropdownMenuItem(
              value: FontWeight.normal,
              child: Text('Normal (w400)'),
            ),
            DropdownMenuItem(
              value: FontWeight.w600,
              child: Text('Semi-Bold (w600)'),
            ),
            DropdownMenuItem(
              value: FontWeight.bold,
              child: Text('Bold (w700)'),
            ),
            DropdownMenuItem(
              value: FontWeight.w900,
              child: Text('Black (w900)'),
            ),
          ],
          onChanged: (val) {
            if (val != null) {
              p.fontWeight = val;
              onChanged();
            }
          },
        ),
        ControlDropdown<TextAlign>(
          label: 'Text Align',
          value: p.textAlign,
          items: TextAlign.values
              .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.textAlign = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Letter Spacing',
          value: p.letterSpacing,
          min: 0,
          max: 6,
          unit: 'px',
          onChanged: (val) {
            p.letterSpacing = val;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Italic Style',
          value: p.isItalic,
          onChanged: (val) {
            p.isItalic = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildContainerControls() {
    final p = appParams.container;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ControlSlider(
                label: 'Width',
                value: p.width,
                min: 80,
                max: 300,
                unit: 'px',
                onChanged: (val) {
                  p.width = val;
                  onChanged();
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ControlSlider(
                label: 'Height',
                value: p.height,
                min: 60,
                max: 200,
                unit: 'px',
                onChanged: (val) {
                  p.height = val;
                  onChanged();
                },
              ),
            ),
          ],
        ),
        ControlColorPicker(
          label: 'Background Color',
          selectedColor: p.color,
          onColorChanged: (c) {
            p.color = c;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Padding',
          value: p.padding,
          min: 0,
          max: 36,
          unit: 'px',
          onChanged: (val) {
            p.padding = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Margin',
          value: p.margin,
          min: 0,
          max: 24,
          unit: 'px',
          onChanged: (val) {
            p.margin = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Border Radius',
          value: p.borderRadius,
          min: 0,
          max: 36,
          unit: 'px',
          onChanged: (val) {
            p.borderRadius = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Border Width',
          value: p.borderWidth,
          min: 0,
          max: 6,
          unit: 'px',
          onChanged: (val) {
            p.borderWidth = val;
            onChanged();
          },
        ),
        if (p.borderWidth > 0)
          ControlColorPicker(
            label: 'Border Color',
            selectedColor: p.borderColor,
            onColorChanged: (c) {
              p.borderColor = c;
              onChanged();
            },
          ),
        ControlSwitch(
          label: 'Drop Shadow',
          value: p.hasShadow,
          onChanged: (val) {
            p.hasShadow = val;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Gradient Mode',
          value: p.hasGradient,
          onChanged: (val) {
            p.hasGradient = val;
            onChanged();
          },
        ),
        if (p.hasGradient)
          ControlColorPicker(
            label: 'Gradient End Color',
            selectedColor: p.gradientEndColor,
            onColorChanged: (c) {
              p.gradientEndColor = c;
              onChanged();
            },
          ),
      ],
    );
  }

  Widget _buildRowControls() {
    final p = appParams.row;
    return Column(
      children: [
        ControlDropdown<MainAxisAlignment>(
          label: 'Main Axis Alignment',
          value: p.mainAxisAlignment,
          items: MainAxisAlignment.values
              .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.mainAxisAlignment = val;
              onChanged();
            }
          },
        ),
        ControlDropdown<CrossAxisAlignment>(
          label: 'Cross Axis Alignment',
          value: p.crossAxisAlignment,
          items: CrossAxisAlignment.values
              .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.crossAxisAlignment = val;
              onChanged();
            }
          },
        ),
        ControlDropdown<MainAxisSize>(
          label: 'Main Axis Size',
          value: p.mainAxisSize,
          items: MainAxisSize.values
              .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.mainAxisSize = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Child Count',
          value: p.itemCount.toDouble(),
          min: 2,
          max: 5,
          divisions: 3,
          unit: 'items',
          onChanged: (val) {
            p.itemCount = val.round();
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Spacing between children',
          value: p.spacing,
          min: 0,
          max: 24,
          unit: 'px',
          onChanged: (val) {
            p.spacing = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildColumnControls() {
    final p = appParams.column;
    return Column(
      children: [
        ControlDropdown<MainAxisAlignment>(
          label: 'Main Axis Alignment',
          value: p.mainAxisAlignment,
          items: MainAxisAlignment.values
              .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.mainAxisAlignment = val;
              onChanged();
            }
          },
        ),
        ControlDropdown<CrossAxisAlignment>(
          label: 'Cross Axis Alignment',
          value: p.crossAxisAlignment,
          items: CrossAxisAlignment.values
              .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.crossAxisAlignment = val;
              onChanged();
            }
          },
        ),
        ControlDropdown<MainAxisSize>(
          label: 'Main Axis Size',
          value: p.mainAxisSize,
          items: MainAxisSize.values
              .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.mainAxisSize = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Child Count',
          value: p.itemCount.toDouble(),
          min: 2,
          max: 4,
          divisions: 2,
          unit: 'items',
          onChanged: (val) {
            p.itemCount = val.round();
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Spacing between children',
          value: p.spacing,
          min: 2,
          max: 20,
          unit: 'px',
          onChanged: (val) {
            p.spacing = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildStackControls() {
    final p = appParams.stack;
    return Column(
      children: [
        ControlDropdown<Alignment>(
          label: 'Stack Alignment',
          value: p.alignment,
          items: const [
            DropdownMenuItem(value: Alignment.center, child: Text('center')),
            DropdownMenuItem(value: Alignment.topLeft, child: Text('topLeft')),
            DropdownMenuItem(
              value: Alignment.topRight,
              child: Text('topRight'),
            ),
            DropdownMenuItem(
              value: Alignment.bottomLeft,
              child: Text('bottomLeft'),
            ),
            DropdownMenuItem(
              value: Alignment.bottomRight,
              child: Text('bottomRight'),
            ),
          ],
          onChanged: (val) {
            if (val != null) {
              p.alignment = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Badge Top Offset',
          value: p.top,
          min: 0,
          max: 50,
          unit: 'px',
          onChanged: (val) {
            p.top = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Badge Right Offset',
          value: p.right,
          min: 0,
          max: 50,
          unit: 'px',
          onChanged: (val) {
            p.right = val;
            onChanged();
          },
        ),
        ControlColorPicker(
          label: 'Badge Color',
          selectedColor: p.badgeColor,
          onColorChanged: (c) {
            p.badgeColor = c;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Show Overlapping Badge',
          value: p.showBadge,
          onChanged: (val) {
            p.showBadge = val;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Show Overlay Text Info',
          value: p.showOverlayText,
          onChanged: (val) {
            p.showOverlayText = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildCardControls() {
    final p = appParams.card;
    return Column(
      children: [
        ControlSlider(
          label: 'Elevation',
          value: p.elevation,
          min: 0,
          max: 16,
          unit: 'dp',
          onChanged: (val) {
            p.elevation = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Border Radius',
          value: p.borderRadius,
          min: 0,
          max: 32,
          unit: 'px',
          onChanged: (val) {
            p.borderRadius = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Internal Padding',
          value: p.padding,
          min: 8,
          max: 32,
          unit: 'px',
          onChanged: (val) {
            p.padding = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Outer Margin',
          value: p.margin,
          min: 0,
          max: 24,
          unit: 'px',
          onChanged: (val) {
            p.margin = val;
            onChanged();
          },
        ),
        ControlColorPicker(
          label: 'Card Surface Color',
          selectedColor: p.color,
          onColorChanged: (c) {
            p.color = c;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildIconControls() {
    final p = appParams.icon;
    return Column(
      children: [
        ControlDropdown<String>(
          label: 'Icon Symbol',
          value: p.iconName,
          items: const [
            DropdownMenuItem(
              value: 'favorite',
              child: Text('Favorite (Heart)'),
            ),
            DropdownMenuItem(value: 'home', child: Text('Home')),
            DropdownMenuItem(value: 'star', child: Text('Star')),
            DropdownMenuItem(value: 'settings', child: Text('Settings')),
            DropdownMenuItem(value: 'person', child: Text('Person')),
            DropdownMenuItem(
              value: 'notifications',
              child: Text('Notification'),
            ),
          ],
          onChanged: (val) {
            if (val != null) {
              p.iconName = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Icon Size',
          value: p.size,
          min: 20,
          max: 84,
          unit: 'px',
          onChanged: (val) {
            p.size = val;
            onChanged();
          },
        ),
        ControlColorPicker(
          label: 'Icon Color',
          selectedColor: p.color,
          onColorChanged: (c) {
            p.color = c;
            onChanged();
          },
        ),
        ControlTextField(
          label: 'Semantic Label (Accessibility)',
          initialValue: p.semanticLabel,
          onChanged: (val) {
            p.semanticLabel = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildImageControls() {
    final p = appParams.image;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ControlSlider(
                label: 'Width',
                value: p.width,
                min: 100,
                max: 300,
                unit: 'px',
                onChanged: (val) {
                  p.width = val;
                  onChanged();
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ControlSlider(
                label: 'Height',
                value: p.height,
                min: 80,
                max: 220,
                unit: 'px',
                onChanged: (val) {
                  p.height = val;
                  onChanged();
                },
              ),
            ),
          ],
        ),
        ControlDropdown<BoxFit>(
          label: 'Fit Mode (BoxFit)',
          value: p.fit,
          items: const [
            DropdownMenuItem(value: BoxFit.cover, child: Text('cover')),
            DropdownMenuItem(value: BoxFit.contain, child: Text('contain')),
            DropdownMenuItem(value: BoxFit.fill, child: Text('fill')),
            DropdownMenuItem(value: BoxFit.fitWidth, child: Text('fitWidth')),
            DropdownMenuItem(value: BoxFit.fitHeight, child: Text('fitHeight')),
            DropdownMenuItem(value: BoxFit.none, child: Text('none')),
          ],
          onChanged: (val) {
            if (val != null) {
              p.fit = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Border Radius (Clipping)',
          value: p.borderRadius,
          min: 0,
          max: 32,
          unit: 'px',
          onChanged: (val) {
            p.borderRadius = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildElevatedButtonControls() {
    final p = appParams.elevatedButton;
    return Column(
      children: [
        ControlTextField(
          label: 'Button Label',
          initialValue: p.text,
          onChanged: (val) {
            p.text = val;
            onChanged();
          },
        ),
        ControlColorPicker(
          label: 'Background Color',
          selectedColor: p.backgroundColor,
          onColorChanged: (c) {
            p.backgroundColor = c;
            onChanged();
          },
        ),
        ControlColorPicker(
          label: 'Text / Foreground Color',
          selectedColor: p.foregroundColor,
          onColorChanged: (c) {
            p.foregroundColor = c;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Elevation',
          value: p.elevation,
          min: 0,
          max: 12,
          unit: 'dp',
          onChanged: (val) {
            p.elevation = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Border Radius',
          value: p.borderRadius,
          min: 0,
          max: 28,
          unit: 'px',
          onChanged: (val) {
            p.borderRadius = val;
            onChanged();
          },
        ),
        Row(
          children: [
            Expanded(
              child: ControlSlider(
                label: 'Horizontal Padding',
                value: p.paddingH,
                min: 8,
                max: 36,
                unit: 'px',
                onChanged: (val) {
                  p.paddingH = val;
                  onChanged();
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ControlSlider(
                label: 'Vertical Padding',
                value: p.paddingV,
                min: 6,
                max: 24,
                unit: 'px',
                onChanged: (val) {
                  p.paddingV = val;
                  onChanged();
                },
              ),
            ),
          ],
        ),
        ControlSwitch(
          label: 'Button Enabled State',
          value: p.enabled,
          onChanged: (val) {
            p.enabled = val;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Include Leading Icon',
          value: p.showIcon,
          onChanged: (val) {
            p.showIcon = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildTextFieldControls() {
    final p = appParams.textField;
    return Column(
      children: [
        ControlTextField(
          label: 'Label Text',
          initialValue: p.labelText,
          onChanged: (val) {
            p.labelText = val;
            onChanged();
          },
        ),
        ControlTextField(
          label: 'Hint Text',
          initialValue: p.hintText,
          onChanged: (val) {
            p.hintText = val;
            onChanged();
          },
        ),
        ControlDropdown<String>(
          label: 'Border Style',
          value: p.borderType,
          items: const [
            DropdownMenuItem(value: 'outline', child: Text('Outline Border')),
            DropdownMenuItem(
              value: 'underline',
              child: Text('Underline Border'),
            ),
            DropdownMenuItem(value: 'none', child: Text('No Border')),
          ],
          onChanged: (val) {
            if (val != null) {
              p.borderType = val;
              onChanged();
            }
          },
        ),
        ControlDropdown<String>(
          label: 'Prefix Icon',
          value: p.prefixIcon,
          items: const [
            DropdownMenuItem(value: 'person', child: Text('Person')),
            DropdownMenuItem(value: 'email', child: Text('Email')),
            DropdownMenuItem(value: 'lock', child: Text('Lock')),
            DropdownMenuItem(value: 'search', child: Text('Search')),
            DropdownMenuItem(value: 'none', child: Text('None')),
          ],
          onChanged: (val) {
            if (val != null) {
              p.prefixIcon = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Border Radius',
          value: p.borderRadius,
          min: 0,
          max: 28,
          unit: 'px',
          onChanged: (val) {
            p.borderRadius = val;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Filled Background',
          value: p.filled,
          onChanged: (val) {
            p.filled = val;
            onChanged();
          },
        ),
        if (p.filled)
          ControlColorPicker(
            label: 'Fill Color',
            selectedColor: p.fillColor,
            palette: [
              Colors.white,
              Colors.grey.shade100,
              Colors.blue.shade50,
              Colors.amber.shade50,
              Colors.green.shade50,
            ],
            onColorChanged: (c) {
              p.fillColor = c;
              onChanged();
            },
          ),
        ControlSwitch(
          label: 'Enabled State',
          value: p.enabled,
          onChanged: (val) {
            p.enabled = val;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Obscure Text (Password)',
          value: p.obscureText,
          onChanged: (val) {
            p.obscureText = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildListViewControls() {
    final p = appParams.listView;
    return Column(
      children: [
        ControlDropdown<Axis>(
          label: 'Scroll Direction',
          value: p.scrollDirection,
          items: const [
            DropdownMenuItem(value: Axis.vertical, child: Text('Vertical')),
            DropdownMenuItem(value: Axis.horizontal, child: Text('Horizontal')),
          ],
          onChanged: (val) {
            if (val != null) {
              p.scrollDirection = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Item Count',
          value: p.itemCount.toDouble(),
          min: 3,
          max: 12,
          divisions: 9,
          unit: 'items',
          onChanged: (val) {
            p.itemCount = val.round();
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Item Spacing',
          value: p.itemSpacing,
          min: 0,
          max: 20,
          unit: 'px',
          onChanged: (val) {
            p.itemSpacing = val;
            onChanged();
          },
        ),
        ControlSwitch(
          label: 'Reverse Scroll Order',
          value: p.reverse,
          onChanged: (val) {
            p.reverse = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildGridViewControls() {
    final p = appParams.gridView;
    return Column(
      children: [
        ControlSlider(
          label: 'Cross Axis Count (Columns)',
          value: p.crossAxisCount.toDouble(),
          min: 2,
          max: 4,
          divisions: 2,
          unit: 'cols',
          onChanged: (val) {
            p.crossAxisCount = val.round();
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Item Count',
          value: p.itemCount.toDouble(),
          min: 4,
          max: 12,
          divisions: 8,
          unit: 'items',
          onChanged: (val) {
            p.itemCount = val.round();
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Main Axis Spacing',
          value: p.mainAxisSpacing,
          min: 2,
          max: 20,
          unit: 'px',
          onChanged: (val) {
            p.mainAxisSpacing = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Cross Axis Spacing',
          value: p.crossAxisSpacing,
          min: 2,
          max: 20,
          unit: 'px',
          onChanged: (val) {
            p.crossAxisSpacing = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Child Aspect Ratio',
          value: p.childAspectRatio,
          min: 0.8,
          max: 2.2,
          divisions: 14,
          onChanged: (val) {
            p.childAspectRatio = val;
            onChanged();
          },
        ),
      ],
    );
  }

  Widget _buildWrapControls() {
    final p = appParams.wrap;
    return Column(
      children: [
        ControlDropdown<Axis>(
          label: 'Direction',
          value: p.direction,
          items: const [
            DropdownMenuItem(value: Axis.horizontal, child: Text('Horizontal')),
            DropdownMenuItem(value: Axis.vertical, child: Text('Vertical')),
          ],
          onChanged: (val) {
            if (val != null) {
              p.direction = val;
              onChanged();
            }
          },
        ),
        ControlDropdown<WrapAlignment>(
          label: 'Wrap Alignment',
          value: p.alignment,
          items: WrapAlignment.values
              .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              p.alignment = val;
              onChanged();
            }
          },
        ),
        ControlSlider(
          label: 'Spacing between chips',
          value: p.spacing,
          min: 2,
          max: 24,
          unit: 'px',
          onChanged: (val) {
            p.spacing = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Run Spacing (Line gap)',
          value: p.runSpacing,
          min: 2,
          max: 24,
          unit: 'px',
          onChanged: (val) {
            p.runSpacing = val;
            onChanged();
          },
        ),
        ControlSlider(
          label: 'Chip Count',
          value: p.chipCount.toDouble(),
          min: 3,
          max: 12,
          divisions: 9,
          unit: 'chips',
          onChanged: (val) {
            p.chipCount = val.round();
            onChanged();
          },
        ),
      ],
    );
  }
}
