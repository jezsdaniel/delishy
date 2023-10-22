import 'package:equatable/equatable.dart';

List<Meal> mealsDataListFromJson(List<dynamic> list) => List<Meal>.from(
      list.map((x) => Meal.fromMap(x as Map<String, dynamic>)),
    );

class Meal extends Equatable {
  const Meal({
    required this.id,
    required this.name,
    this.drinkAlternate,
    this.category,
    this.area,
    this.instructions,
    this.thumb,
    this.tags = const [],
    this.youtube,
    this.ingredients = const [],
    this.measures = const [],
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    final tags = <String>[];
    final ingredients = <String>[];
    final measures = <String>[];

    if (map['strTags'] != null) {
      tags.addAll((map['strTags'] as String).split(','));
    }

    for (var i = 1; i <= 20; i++) {
      if (map['strIngredient$i'] != null && map['strIngredient$i'] != '') {
        ingredients.add(map['strIngredient$i'] as String);
      }
    }

    for (var i = 1; i <= 20; i++) {
      if (map['strMeasure$i'] != null && map['strMeasure$i'] != '') {
        measures.add(map['strMeasure$i'] as String);
      }
    }

    return Meal(
      id: map['idMeal'] as String,
      name: map['strMeal'] as String,
      drinkAlternate: map['strDrinkAlternate'] as String?,
      category: map['strCategory'] as String?,
      area: map['strArea'] as String?,
      instructions: map['strInstructions'] as String?,
      thumb: map['strMealThumb'] as String?,
      tags: tags,
      youtube: map['strYoutube'] as String?,
      ingredients: ingredients,
      measures: measures,
    );
  }

  final String id;
  final String name;
  final String? drinkAlternate;
  final String? category;
  final String? area;
  final String? instructions;
  final String? thumb;
  final List<String> tags;
  final String? youtube;
  final List<String> ingredients;
  final List<String> measures;

  @override
  List<Object?> get props => [
        id,
        name,
        drinkAlternate,
        category,
        area,
        instructions,
        thumb,
        tags,
        youtube,
        ingredients,
        measures,
      ];
}
