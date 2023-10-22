import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  group('DailyRecipe', () {
    testWidgets('renders daily recipe name', (tester) async {
      await tester.pumpApp(const DailyRecipe());
      expect(find.byKey(const Key('dailyRecipe_name')), findsOneWidget);
    });
    testWidgets('renders daily recipe time', (tester) async {
      await tester.pumpApp(const DailyRecipe());
      expect(find.byKey(const Key('dailyRecipe_time')), findsOneWidget);
    });
    testWidgets('renders daily recipe portions', (tester) async {
      await tester.pumpApp(const DailyRecipe());
      expect(find.byKey(const Key('dailyRecipe_portions')), findsOneWidget);
    });
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const DailyRecipe());
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
