// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_test/home/home.dart';

void main() {
  // Define a custom pumpWidget function
  Future<void> pumpWidget(WidgetTester tester, Widget widget) async {
    return tester.pumpWidget(
      MaterialApp(
        home: widget,
      ),
    );
  }

  group('HomePage', () {
    testWidgets('HomePage displays correct initial content',
        (WidgetTester tester) async {
      await pumpWidget(tester, const HomePage());

      // Verify that the initial content is displayed correctly
      expect(find.text('Hello there'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('Tapping anywhere changes background color',
        (WidgetTester tester) async {
      await pumpWidget(tester, const HomePage());

      // Get the initial background color
      final Color? initialBackgroundColor =
          tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;

      // Tap anywhere on the screen
      await tester.tap(find.byType(Scaffold));
      await tester.pump();

      // Get the updated background color
      final Color? updatedBackgroundColor =
          tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;

      // Verify that the background color has changed
      expect(updatedBackgroundColor, isNot(initialBackgroundColor));
    });
  });
}
