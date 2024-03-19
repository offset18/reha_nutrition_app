import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:reha_nutrition_app/main.dart';

void main() {
  testWidgets('Reha-Nutrition App', (WidgetTester tester) async {
    const testWidget = MaterialApp(
      home: MyApp(),
    );

    // Widget rendern
    await tester.pumpWidget(testWidget);
    // Warten bis keine neuen Frames gerendert werden müssen (z.B. Animationen sind fertig)
    await tester.pumpAndSettle();


    expect(matching: find.text('Reha-Nutrition App'));)
  });
}
