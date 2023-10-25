import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/exceptions.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/network/connectivity.dart';
import 'package:delishy/core/network/connectivity_mock.dart';
import 'package:delishy/features/recipes/data/data_sources/recipes_remote_api_mock.dart';
import 'package:delishy/features/recipes/data/models/responses/random_meal.dart';
import 'package:delishy/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/random_meal.dart';

void main() {
  group('getRandomMeal', () {
    late MockRecipesRemoteApi mockApi;
    late MockConnectivityService mockConnectivityService;
    late RecipesRepositoryImpl repository;

    setUpAll(() {
      mockApi = MockRecipesRemoteApi();
      mockConnectivityService = MockConnectivityService();
      repository = RecipesRepositoryImpl(mockApi, mockConnectivityService);
    });

    test('getRandomMeal should return a RandomMealResponseModel on success',
        () async {
      when(() => mockConnectivityService.connectionStatus)
          .thenReturn(ConnectionStatus.online);

      const expectedResponse = randomMealEntityMock;
      when(mockApi.getRandomMeal).thenAnswer((_) async => expectedResponse);

      final result = await repository.getRandomMeal();

      expect(
        result,
        const Right<Failure, RandomMealResponseModel>(expectedResponse),
      );
    });

    test('getRandomMeal should return NetworkFailure if offline', () async {
      when(() => mockConnectivityService.connectionStatus)
          .thenReturn(ConnectionStatus.offline);

      final result = await repository.getRandomMeal();

      expect(result, Left<Failure, RandomMealResponseModel>(NetworkFailure()));
    });

    test('getRandomMeal should return ServerFailure on API error', () async {
      when(() => mockConnectivityService.connectionStatus)
          .thenReturn(ConnectionStatus.online);

      when(mockApi.getRandomMeal).thenThrow(ServerException(message: 'Error'));

      final result = await repository.getRandomMeal();

      expect(result, Left<Failure, RandomMealResponseModel>(ServerFailure()));
    });

    test('getRandomMeal should return a generic Failure on unexpected error',
        () async {
      when(() => mockConnectivityService.connectionStatus)
          .thenReturn(ConnectionStatus.online);

      when(mockApi.getRandomMeal).thenThrow(Exception());

      final result = await repository.getRandomMeal();

      expect(result, Left<Failure, RandomMealResponseModel>(Failure()));
    });
  });
}
