import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reha_nutrition_app/view/Excercises/reha.dart';

import 'package:reha_nutrition_app/view/meals/meal_view.dart';

void main() {
  testWidgets('Rehas', (WidgetTester tester) async {
    const testWidget = MaterialApp(
        home: RehasPage(),
    );

    // Widget rendern
    await tester.pumpWidget(testWidget);
    // Warten bis keine neuen Frames gerendert werden müssen (z.B. Animationen sind fertig)
    await tester.pumpAndSettle();

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    expect(find.descendant(of: appBar, matching: find.text('Rehas')), findsOneWidget);
  });
}
