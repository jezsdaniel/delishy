import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/daily_recipe_bloc_mock.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:delishy/features/recipes/presentation/pages/recipe_details/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  const mealWithImage = Meal(
    name: 'Test Meal',
    thumb: 'https://example.com/test.jpg',
    area: 'Test Area',
    category: 'Test Category',
    tags: ['Tag1', 'Tag2'],
    ingredients: ['Ingredient1', 'Ingredient2'],
    measures: ['Measure1', 'Measure2'],
    instructions: 'Test instructions',
    id: '1',
  );

  const mealWithoutImage = Meal(
    name: 'Test Meal',
    area: 'Test Area',
    category: 'Test Category',
    tags: ['Tag1', 'Tag2'],
    ingredients: ['Ingredient1', 'Ingredient2'],
    measures: ['Measure1', 'Measure2'],
    instructions: 'Test instructions',
    id: '1',
  );

  late FavoritesBloc favoritesBloc;

  setUpAll(() {
    favoritesBloc = FavoritesBlocMock();
    when(() => favoritesBloc.state).thenReturn(
      const FavoritesState(status: RequestStatus.success),
    );
  });

  group('RecipeDetailsPage', () {
    testWidgets('renders recipe details view', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          BlocProvider(
            create: (context) => favoritesBloc,
            child: const RecipeDetailsPage(recipe: mealWithImage),
          ),
        ),
      );
      expect(find.byType(RecipeDetailsView), findsOneWidget);
    });
  });

  group('RecipeDetailsView', () {
    testWidgets('renders recipe details page with image', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          BlocProvider(
            create: (context) => favoritesBloc,
            child: const RecipeDetailsPage(recipe: mealWithImage),
          ),
        ),
      );
      expect(find.text(mealWithImage.name), findsWidgets);
      expect(find.byType(Image, skipOffstage: false), findsOneWidget);
      expect(
        find.byKey(const Key('recipeDetails_area')),
        findsOneWidget,
      );
      expect(find.byKey(const Key('recipeDetails_category')), findsOneWidget);
      expect(find.byKey(const Key('recipeDetails_tags')), findsOneWidget);
      expect(
          find.byKey(const Key('recipeDetails_ingredients')), findsOneWidget);
      expect(
          find.byKey(const Key('recipeDetails_instructions')), findsOneWidget);
    });

    testWidgets('renders recipe details page without image', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          BlocProvider(
            create: (context) => favoritesBloc,
            child: const RecipeDetailsPage(recipe: mealWithoutImage),
          ),
        ),
      );
      expect(find.text(mealWithoutImage.name), findsWidgets);
      expect(find.byKey(const Key('recipeDetails_noImage')), findsOneWidget);
      expect(find.byType(Image, skipOffstage: false), findsNothing);
      expect(find.byKey(const Key('recipeDetails_area')), findsOneWidget);
      expect(find.byKey(const Key('recipeDetails_category')), findsOneWidget);
      expect(find.byKey(const Key('recipeDetails_tags')), findsOneWidget);
      expect(
          find.byKey(const Key('recipeDetails_ingredients')), findsOneWidget);
      expect(
          find.byKey(const Key('recipeDetails_instructions')), findsOneWidget);
    });

    testWidgets('renders recipe details page with tags', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          BlocProvider(
            create: (context) => favoritesBloc,
            child: const RecipeDetailsPage(recipe: mealWithImage),
          ),
        ),
      );
      for (final tag in mealWithImage.tags) {
        expect(find.text(tag), findsOneWidget);
      }
    });

    testWidgets('renders recipe details page with ingredients', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          BlocProvider(
            create: (context) => favoritesBloc,
            child: const RecipeDetailsPage(recipe: mealWithImage),
          ),
        ),
      );
      for (var i = 0; i < mealWithImage.ingredients.length; i++) {
        expect(
          find.text(
              '${mealWithImage.ingredients[i]} - ${mealWithImage.measures[i]}'),
          findsOneWidget,
        );
      }
    });

    testWidgets('renders recipe details page without ingredients',
        (tester) async {
      const mealWithoutIngredients = Meal(
        name: 'Test Meal',
        thumb: 'https://example.com/test.jpg',
        area: 'Test Area',
        category: 'Test Category',
        tags: ['Tag1', 'Tag2'],
        instructions: 'Test instructions',
        id: '1',
      );

      await mockNetworkImagesFor(
        () => tester.pumpApp(
          BlocProvider(
            create: (context) => favoritesBloc,
            child: const RecipeDetailsPage(recipe: mealWithoutIngredients),
          ),
        ),
      );
      expect(find.text('Ingredients'), findsNothing);
    });

    testWidgets('renders recipe details page with instructions',
        (tester) async {
          await mockNetworkImagesFor(
                () => tester.pumpApp(
              BlocProvider(
                create: (context) => favoritesBloc,
                child: const RecipeDetailsPage(recipe: mealWithImage),
              ),
            ),
          );

      expect(find.text(mealWithImage.instructions ?? ''), findsOneWidget);
    });

    testWidgets('renders recipe details page without instructions',
        (tester) async {
      const mealWithoutInstructions = Meal(
        name: 'Test Meal',
        thumb: 'https://example.com/test.jpg',
        area: 'Test Area',
        category: 'Test Category',
        tags: ['Tag1', 'Tag2'],
        ingredients: ['Ingredient1', 'Ingredient2'],
        measures: ['Measure1', 'Measure2'],
        id: '1',
      );

      await mockNetworkImagesFor(
            () => tester.pumpApp(
          BlocProvider(
            create: (context) => favoritesBloc,
            child: const RecipeDetailsPage(recipe: mealWithoutInstructions),
          ),
        ),
      );
      expect(find.text('Instructions'), findsNothing);
    });
  });
}
