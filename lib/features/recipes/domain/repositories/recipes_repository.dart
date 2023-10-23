import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/features/recipes/data/models/responses/random_meal.dart';

abstract class RecipesRepository {
  Future<Either<Failure, RandomMealResponseModel>> getRandomMeal();
}
