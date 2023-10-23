import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../../helpers/helpers.dart';
import '../../../../data/mocks/random_meal.dart';

void main() {
  group('DailyRecipeSuccess', () {
    final meal = randomMealEntityMock.meal;

    testWidgets('renders meal name, area, category, and image', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          DailyRecipeSuccess(meal: meal),
        ),
      );

      expect(find.byKey(const Key('dailyRecipe_name')), findsOneWidget);
      expect(find.byKey(const Key('dailyRecipe_area')), findsOneWidget);
      expect(find.byKey(const Key('dailyRecipe_category')), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('displays correct meal name, area, category, and image',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          DailyRecipeSuccess(meal: meal),
        ),
      );

      expect(find.text(meal.name), findsOneWidget);
      expect(find.text(meal.area ?? ''), findsOneWidget);
      expect(find.text(meal.category ?? ''), findsOneWidget);
    });

    testWidgets('displays food icon when meal.thumb is null', (tester) async {
      await tester.pumpApp(
        const DailyRecipeSuccess(
          meal: Meal(
            name: 'No Image',
            id: '1',
          ),
        ),
      );

      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('displays meal image when meal.thumb is not null',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          DailyRecipeSuccess(meal: meal),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });
  });
}
