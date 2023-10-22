import 'dart:convert';

import 'package:delishy/core/constants/endpoints.dart';
import 'package:delishy/core/errors/exceptions.dart';
import 'package:delishy/features/recipes/data/data_sources/recipes_remote_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../mocks/random_meal.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('getRandomMeal', () {
    final mockHttpClient = MockHttpClient();
    final recipesRemoteApi = RecipesRemoteApiImpl(
      httpClient: mockHttpClient,
    );

    test(
        'getRandomMeal should return a RandomMealResponseModel if the HTTP request is successful',
        () async {
      when(() => mockHttpClient.get(Uri.parse(Endpoints.getRandomMeal)))
          .thenAnswer(
        (_) async => http.Response(
          json.encode(randomMealNetworkMock),
          200,
        ),
      );
      final result = await recipesRemoteApi.getRandomMeal();
      expect(result, equals(randomMealEntityMock));
    });

    test(
        'getRandomMeal should throw a ServerException if the HTTP request is unsuccessful',
        () async {
      when(() => mockHttpClient.get(Uri.parse(Endpoints.getRandomMeal)))
          .thenAnswer(
        (_) async => http.Response(
          'Something went wrong',
          500,
        ),
      );
      expect(
        recipesRemoteApi.getRandomMeal,
        throwsA(isA<ServerException>()),
      );
    });
  });
}
