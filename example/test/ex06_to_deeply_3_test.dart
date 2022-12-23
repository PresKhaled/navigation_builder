import 'package:example/ex06_to_deeply_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Test Navigation logic',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(HomePage), findsOneWidget);
      expect(navigator.routeData.location, '/');
      //
      await tester.tap(find.text('Navigate using "to"'));
      await tester.pumpAndSettle();
      expect(find.text('Page1/Page11/Page111/Page1111'), findsNWidgets(2));
      expect(navigator.routeData.location, '/page1/page11/page111/page1111');
      //
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
      expect(navigator.routeData.location, '/');
      //
      await tester.tap(find.text('Navigate using "toDeeply"'));
      await tester.pumpAndSettle();
      expect(find.text('Page1/Page11/Page111/Page1111'), findsNWidgets(2));
      expect(navigator.routeData.location, '/page1/page11/page111/page1111');
      //
      await tester.tap(find.byType(BackButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150));
      expect(find.text('Page1/Page11/Page111/Page1111'), findsNWidgets(2));
      expect(find.text('Page1/Page11/Page111'), findsNWidgets(2));
      expect(find.byType(BackButton), findsNWidgets(2));
      await tester.pumpAndSettle();
      expect(find.text('Page1/Page11/Page111'), findsNWidgets(2));
      expect(navigator.routeData.location, '/page1/page11/page111');
      expect(find.byType(BackButton), findsNWidgets(1));
      //
      await tester.tap(find.byType(BackButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150));
      expect(find.text('Page1/Page11/Page111'), findsNWidgets(2));
      expect(find.text('Page1/Page11'), findsNWidgets(2));
      await tester.pumpAndSettle();
      expect(find.text('Page1/Page11'), findsNWidgets(2));
      expect(navigator.routeData.location, '/page1/page11');

      await tester.tap(find.byType(BackButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150));
      expect(find.text('Page1/Page11'), findsNWidgets(2));
      expect(navigator.routeData.location, '/page1');
      await tester.pumpAndSettle();
      expect(find.text('Page1'), findsNWidgets(2));
      expect(navigator.routeData.location, '/page1');
      //
      await tester.tap(find.byType(BackButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150));
      expect(find.text('Page1'), findsNWidgets(2));
      expect(navigator.routeData.location, '/');
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
      expect(navigator.routeData.location, '/');
      //
      await tester.tap(find.text('Navigate using "toDeeply"'));
      await tester.pumpAndSettle();
      expect(find.text('Page1/Page11/Page111/Page1111'), findsNWidgets(2));
      expect(navigator.routeData.location, '/page1/page11/page111/page1111');

      //
    },
  );

  testWidgets(
    'NavigationBuilder is reset between tests',
    (tester) async {
      expect(navigator.routeData.location, '/');
    },
  );
}
