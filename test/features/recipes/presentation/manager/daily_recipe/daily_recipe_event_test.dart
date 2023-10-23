import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DailyRecipeEvent', () {
    group('DailyRecipeRequested', () {
      test('support value equality', () {
        const instanceA = DailyRecipeRequested();
        const instanceB = DailyRecipeRequested();
        expect(instanceA, equals(instanceB));
      });
    });
  });
}
