import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, int>> addFavorite(Meal meal);

  Future<Either<Failure, int>> removeFavorites(Meal meal);

  Future<Either<Failure, Stream<List<Meal>>>> getAllFavorites();
}
