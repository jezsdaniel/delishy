import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/exceptions.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/network/connectivity.dart';
import 'package:delishy/features/recipes/data/data_sources/recipes_remote_api.dart';
import 'package:delishy/features/recipes/data/models/responses/random_meal.dart';
import 'package:delishy/features/recipes/domain/repositories/recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  RecipesRepositoryImpl(
    this.api,
    this.connectivityService,
  );

  final RecipesRemoteApi api;
  final ConnectivityService connectivityService;

  @override
  Future<Either<Failure, RandomMealResponseModel>> getRandomMeal() async {
    try {
      if (connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      final resp = await api.getRandomMeal();

      return Right(resp);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure());
      } else {
        return Left(Failure());
      }
    }
  }
}
