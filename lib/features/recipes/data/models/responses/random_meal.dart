import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:equatable/equatable.dart';

class RandomMealResponseModel extends Equatable {
  const RandomMealResponseModel({
    required this.meal,
  });

  factory RandomMealResponseModel.fromJson(List<dynamic> json) =>
      RandomMealResponseModel(
        meal: mealsDataListFromJson(json).first,
      );

  final Meal meal;

  @override
  List<Object?> get props => [
        meal,
      ];
}
