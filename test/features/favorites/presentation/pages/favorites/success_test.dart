import 'package:delishy/features/favorites/presentation/pages/favorites/success.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:delishy/features/recipes/presentation/pages/recipe_details/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../recipes/data/mocks/random_meal.dart';

void main() {
  group('FavoritesSuccess', () {
    final meal = randomMealEntityMock.meal;

    testWidgets('renders meal name, area, category, and image', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          FavoritesSuccess(favorites: [
            meal,
          ]),
        ),
      );

      expect(find.byKey(const Key('favoritesSuccess_name')), findsOneWidget);
      expect(find.byKey(const Key('favoritesSuccess_area')), findsOneWidget);
      expect(find.byKey(const Key('favoritesSuccess_category')), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('displays correct meal name, area, category, and image',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          FavoritesSuccess(favorites: [meal]),
        ),
      );

      expect(find.text(meal.name), findsOneWidget);
      expect(find.text(meal.area ?? ''), findsOneWidget);
      expect(find.text(meal.category ?? ''), findsOneWidget);
    });

    testWidgets('displays food icon when meal.thumb is null', (tester) async {
      await tester.pumpApp(
        const FavoritesSuccess(
          favorites: [
            Meal(
              name: 'No Image',
              id: '1',
            ),
          ],
        ),
      );

      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('displays meal image when meal.thumb is not null',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          FavoritesSuccess(favorites: [meal]),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('tapping on recipe card navigates to recipe details',
        (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpRouterApp(
          FavoritesSuccess(favorites: [meal]),
        ),
      );
      await tester.ensureVisible(
        find.byType(InkWell, skipOffstage: false),
      );
      await tester.tap(
        find.byType(InkWell, skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(RecipeDetailsPage), findsOneWidget);
      expect(find.byType(FavoritesSuccess), findsNothing);
    });
  });
}
