import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/use_cases/use_case.dart';
import 'package:delishy/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';

class GetAllFavoritesUseCase implements UseCase<Stream<List<Meal>>, NoParams> {
  GetAllFavoritesUseCase(this.repository);

  final FavoritesRepository repository;

  @override
  Future<Either<Failure, Stream<List<Meal>>>> call(NoParams noParams) async {
    return repository.getAllFavorites();
  }
}
