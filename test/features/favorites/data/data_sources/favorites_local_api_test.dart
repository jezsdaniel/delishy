import 'package:delishy/features/favorites/data/data_sources/favorites_local_api.dart';
import 'package:delishy/features/favorites/data/data_sources/favorites_local_api_mock.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FavoritesLocalStorage', () {
    late FavoritesLocalStorage favoritesLocalStorage;

    setUpAll(() async {
      favoritesLocalStorage = FavoritesLocalStorageMock();
    });

    const testMeal = Meal(
      id: '1',
      name: 'Test Meal',
      category: 'Test Category',
      area: 'Test Area',
      instructions: 'Test Instructions',
      thumb: 'Test Thumb',
      tags: ['Tag1', 'Tag2'],
      ingredients: ['Ingredient1', 'Ingredient2'],
      measures: ['Measure1', 'Measure2'],
    );

    test('init initializes the database', () async {
      expect(favoritesLocalStorage, isA<FavoritesLocalStorage>());
    });

    test('addFavorite adds a meal to the database', () async {
      final stream = favoritesLocalStorage.getAllFavorites();
      await favoritesLocalStorage.addFavorite(testMeal);
      final favorites = await stream.first;
      expect(favorites, contains(testMeal));
    });

    test('removeFavorite removes a meal from the database', () async {
      await favoritesLocalStorage.addFavorite(testMeal);
      await favoritesLocalStorage.removeFavorite(testMeal);
      final stream = favoritesLocalStorage.getAllFavorites();
      final favorites = await stream.first;
      expect(favorites, isNot(contains(testMeal)));
    });

    test('getAllFavorites should return a Stream of meals', () async {
      final meals = [
        const Meal(id: '3', name: 'Test Meal 3'),
        const Meal(id: '2', name: 'Test Meal 2'),
        const Meal(id: '1', name: 'Test Meal 1'),
      ];
      for (final meal in meals) {
        await favoritesLocalStorage.addFavorite(meal);
      }
      final stream = favoritesLocalStorage.getAllFavorites();
      final favorites = await stream.first;
      expect(favorites, meals);
    });
  });
}
