import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:ikram_portfolio/app/app.dart';

void main() {
  testWidgets('Portfolio home renders key sections', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const IkramPortfolio());
    await tester.pump();

    expect(find.text('IK.'), findsWidgets);
    expect(find.text('Featured '), findsOneWidget);
    expect(find.text('// experience'), findsOneWidget);
  });
}
