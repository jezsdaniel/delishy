import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../helpers/helpers.dart';

void main() {
  group('DailyRecipeLoading', () {
    testWidgets('renders daily recipe name', (tester) async {
      await tester.pumpApp(const DailyRecipeLoading());
      expect(find.byKey(const Key('dailyRecipeLoading_name')), findsOneWidget);
    });
    testWidgets('renders daily recipe area', (tester) async {
      await tester.pumpApp(const DailyRecipeLoading());
      expect(find.byKey(const Key('dailyRecipeLoading_area')), findsOneWidget);
    });
    testWidgets('renders daily recipe category', (tester) async {
      await tester.pumpApp(const DailyRecipeLoading());
      expect(
          find.byKey(const Key('dailyRecipeLoading_category')), findsOneWidget);
    });
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const DailyRecipeLoading());
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
