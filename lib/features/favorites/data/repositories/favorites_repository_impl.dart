import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/features/favorites/data/data_sources/favorites_local_api.dart';
import 'package:delishy/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl(
    this.api,
  );

  final FavoritesLocalStorage api;

  @override
  Future<Either<Failure, int>> addFavorite(Meal meal) async {
    try {
      final resp = await api.addFavorite(meal);

      return Right(resp);
    } catch (ex) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, int>> removeFavorites(Meal meal) async {
    try {
      final resp = await api.removeFavorite(meal);

      return Right(resp);
    } catch (ex) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Stream<List<Meal>>>> getAllFavorites() async {
    try {
      final resp = await api.getAllFavorites();

      return Right(resp);
    } catch (ex) {
      return Left(Failure());
    }
  }
}
