import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  const meal = Meal(
    name: 'Test Meal',
    area: 'Test Area',
    category: 'Test Category',
    tags: ['Tag1', 'Tag2'],
    ingredients: ['Ingredient1', 'Ingredient2'],
    measures: ['Measure1', 'Measure2'],
    instructions: 'Test instructions',
    id: '1',
  );

  group('FavoritesEvent', () {
    group('FavoritesEventSubscriptionRequested', () {
      test('support value equality', () {
        const instanceA = FavoritesEventSubscriptionRequested();
        const instanceB = FavoritesEventSubscriptionRequested();
        expect(instanceA, equals(instanceB));
      });
    });
    group('FavoritesEventToggle', () {
      test('support value equality', () {
        const instanceA = FavoritesEventToggle(meal);
        const instanceB = FavoritesEventToggle(meal);
        expect(instanceA, equals(instanceB));
      });
    });
  });
}
