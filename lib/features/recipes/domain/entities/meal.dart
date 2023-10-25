import 'package:equatable/equatable.dart';

List<Meal> mealsDataListFromJson(List<dynamic> list) => List<Meal>.from(
      list.map((x) => Meal.fromMap(x as Map<String, dynamic>)),
    );

class Meal extends Equatable {
  const Meal({
    required this.id,
    required this.name,
    this.category,
    this.area,
    this.instructions,
    this.thumb,
    this.tags = const [],
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
      category: map['strCategory'] as String?,
      area: map['strArea'] as String?,
      instructions: map['strInstructions'] as String?,
      thumb: map['strMealThumb'] as String?,
      tags: tags,
      ingredients: ingredients,
      measures: measures,
    );
  }

  factory Meal.fromDbMap(Map<String, dynamic> map) {
    final tags = <String>[];
    final ingredients = <String>[];
    final measures = <String>[];

    if (map['tags'] != null) {
      tags.addAll((map['tags'] as String).split(','));
    }

    if (map['ingredients'] != null) {
      ingredients.addAll((map['ingredients'] as String).split(','));
    }

    if (map['measures'] != null) {
      measures.addAll((map['measures'] as String).split(','));
    }

    return Meal(
      id: map['id'] as String,
      name: map['name'] as String,
      category: map['category'] as String?,
      area: map['area'] as String?,
      instructions: map['instructions'] as String?,
      thumb: map['thumb'] as String?,
      tags: tags,
      ingredients: ingredients,
      measures: measures,
    );
  }

  Map<String, dynamic> toDbMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'area': area,
      'instructions': instructions,
      'thumb': thumb,
      'tags': tags.join(','),
      'ingredients': ingredients.join(','),
      'measures': measures.join(','),
    };
  }

  static const empty = Meal(
    id: '',
    name: '',
  );

  final String id;
  final String name;
  final String? category;
  final String? area;
  final String? instructions;
  final String? thumb;
  final List<String> tags;
  final List<String> ingredients;
  final List<String> measures;

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        area,
        instructions,
        thumb,
        tags,
        ingredients,
        measures,
      ];
}
