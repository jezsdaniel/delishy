import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/use_cases/use_case.dart';
import 'package:delishy/features/recipes/data/models/responses/random_meal.dart';
import 'package:delishy/features/recipes/domain/repositories/recipes_repository.dart';

class GetRandomMealUseCase implements UseCase<RandomMealResponseModel, void> {
  GetRandomMealUseCase(this.repository);

  final RecipesRepository repository;

  @override
  Future<Either<Failure, RandomMealResponseModel>> call({void params}) async {
    return repository.getRandomMeal();
  }
}
