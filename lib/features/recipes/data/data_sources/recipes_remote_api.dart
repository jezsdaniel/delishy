import 'dart:convert';

import 'package:delishy/core/constants/endpoints.dart';
import 'package:delishy/core/errors/exceptions.dart';
import 'package:delishy/features/recipes/data/models/responses/random_meal.dart';
import 'package:http/http.dart' as http;

abstract class RecipesRemoteApi {
  Future<RandomMealResponseModel> getRandomMeal();
}

class RecipesRemoteApiImpl extends RecipesRemoteApi {
  RecipesRemoteApiImpl({
    required this.httpClient,
  });

  final http.Client httpClient;

  @override
  Future<RandomMealResponseModel> getRandomMeal() async {
    try {
      final res = await httpClient.get(Uri.parse(Endpoints.getRandomMeal));
      if (res.statusCode == 200) {
        return RandomMealResponseModel.fromJson(
            json.decode(res.body)['meals'] as List<dynamic>);
      } else {
        throw ServerException(message: 'Something went wrong');
      }
    } catch (ex) {
      throw ServerException(message: 'Something went wrong');
    }
  }
}
