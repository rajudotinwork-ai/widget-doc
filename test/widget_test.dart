import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_widgets_documentation/data/widget_catalog.dart';
import 'package:flutter_widgets_documentation/main.dart';

void main() {
  testWidgets('Docs smoke test - initial Text preview', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Widgets Documentation'), findsOneWidget);
    expect(find.text('Flutter Widgets'), findsOneWidget);
    // Initial selection is Text
    expect(find.text('Hello, Flutter!'), findsOneWidget);
  });

  testWidgets('Catalog has all 13 widgets', (WidgetTester tester) async {
    expect(widgetCatalog.length, 13);

    const expectedNames = [
      'Text',
      'Container',
      'Row',
      'Column',
      'Stack',
      'Card',
      'Icon',
      'Image',
      'ElevatedButton',
      'TextField',
      'ListView',
      'GridView',
      'Wrap',
    ];

    for (final name in expectedNames) {
      expect(
        widgetCatalog.any((w) => w.name == name),
        isTrue,
        reason: 'Widget $name must be in widgetCatalog',
      );
    }
  });

  testWidgets('Selecting widgets from sidebar switches preview', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MyApp());

    // Tap on Container
    await tester.tap(find.widgetWithText(ListTile, 'Container'));
    await tester.pumpAndSettle();
    expect(find.text('Styled Container'), findsOneWidget);

    // Tap on Card
    await tester.tap(find.widgetWithText(ListTile, 'Card'));
    await tester.pumpAndSettle();
    expect(find.text('Material Card'), findsOneWidget);

    // Tap on ElevatedButton
    await tester.tap(find.widgetWithText(ListTile, 'ElevatedButton'));
    await tester.pumpAndSettle();
    expect(find.text('Primary Button'), findsOneWidget);
  });
}
