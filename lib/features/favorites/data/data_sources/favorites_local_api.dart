import 'package:delishy/features/recipes/domain/entities/meal.dart';

abstract class FavoritesLocalStorage {
  Future<int> addFavorite(Meal meal);

  Future<int> removeFavorite(Meal meal);

  Stream<List<Meal>> getAllFavorites();
}
