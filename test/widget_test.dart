import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_widgets_documentation/data/widget_catalog.dart';
import 'package:flutter_widgets_documentation/main.dart';

void main() {
  testWidgets('Docs smoke test - initial Text preview and controls', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Widgets Documentation'), findsOneWidget);
    expect(find.text('Flutter Widgets'), findsOneWidget);
    expect(find.text('Text Parameters'), findsOneWidget);
    expect(find.text('Generated Dart Code'), findsOneWidget);
    expect(find.text('Copy Code'), findsOneWidget);
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

  testWidgets('Changing Text parameter updates preview and generated code', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MyApp());

    // Locate the Text Content input field
    final textFieldFinder = find.widgetWithText(TextField, 'Hello, Flutter!');
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'Updated Dynamic Text');
    await tester.pump();

    // Verify preview has updated text
    expect(find.text('Updated Dynamic Text'), findsWidgets);

    // Verify code block contains updated text
    expect(find.textContaining('Updated Dynamic Text'), findsWidgets);

    // Test Reset to Defaults button
    final resetButton = find.widgetWithText(
      OutlinedButton,
      'Reset to Defaults',
    );
    expect(resetButton, findsOneWidget);
    await tester.tap(resetButton);
    await tester.pump();

    expect(find.text('Hello, Flutter!'), findsWidgets);
  });

  testWidgets('Selecting widgets from sidebar switches preview & controls', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MyApp());

    // Tap on Container
    await tester.tap(find.widgetWithText(ListTile, 'Container'));
    await tester.pumpAndSettle();
    expect(find.text('Container Parameters'), findsOneWidget);
    expect(find.text('Container Child'), findsOneWidget);

    // Tap on Card
    await tester.tap(find.widgetWithText(ListTile, 'Card'));
    await tester.pumpAndSettle();
    expect(find.text('Card Parameters'), findsOneWidget);
    expect(find.text('Material Card'), findsOneWidget);

    // Tap on ElevatedButton
    await tester.tap(find.widgetWithText(ListTile, 'ElevatedButton'));
    await tester.pumpAndSettle();
    expect(find.text('ElevatedButton Parameters'), findsOneWidget);
    expect(find.text('Click Me'), findsWidgets);

    // Test Copy Code button
    final copyButton = find.widgetWithText(FilledButton, 'Copy Code');
    expect(copyButton, findsOneWidget);
    await tester.ensureVisible(copyButton);
    await tester.pumpAndSettle();
    await tester.tap(copyButton);
    await tester.pump();
    expect(find.text('Dart code copied to clipboard!'), findsOneWidget);
  });

  testWidgets(
    'All 13 widgets can be selected and display preview and controls',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MyApp());

      for (int i = 0; i < widgetCatalog.length; i++) {
        final name = widgetCatalog[i].name;
        final tileFinder = find.widgetWithText(ListTile, name);
        await tester.scrollUntilVisible(
          tileFinder,
          100,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(tileFinder);
        await tester.pumpAndSettle();

        expect(find.text('$name Parameters'), findsOneWidget);
        expect(find.text('Generated Dart Code'), findsOneWidget);
      }
    },
  );
}
