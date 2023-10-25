import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/use_cases/use_case.dart';
import 'package:delishy/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';

class RemoveFavoriteUseCase implements UseCase<int, Params<Meal>> {
  RemoveFavoriteUseCase(this.repository);

  final FavoritesRepository repository;

  @override
  Future<Either<Failure, int>> call(Params<Meal> params) async {
    return repository.removeFavorites(params.request);
  }
}
