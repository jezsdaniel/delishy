import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/exceptions.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/network/connectivity.dart';
import 'package:delishy/features/recipes/data/data_sources/recipes_remote_api.dart';
import 'package:delishy/features/recipes/data/models/responses/random_meal.dart';
import 'package:delishy/features/recipes/domain/repositories/recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  RecipesRepositoryImpl(
    this._api,
    this._connectivityService,
  );

  final RecipesRemoteApi _api;
  final ConnectivityService _connectivityService;

  @override
  Future<Either<Failure, RandomMealResponseModel>> getRandomMeal() async {
    try {
      if (_connectivityService.connectionStatus == ConnectionStatus.offline) {
        return Left(NetworkFailure());
      }

      final resp = await _api.getRandomMeal();

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
