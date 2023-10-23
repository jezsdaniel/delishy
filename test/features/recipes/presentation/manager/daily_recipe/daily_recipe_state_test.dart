import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DailyRecipeState', () {
    test('supports value equality', () {
      expect(const DailyRecipeState(), equals(const DailyRecipeState()));
    });
    test('should return a copy with updated status', () {
      const state = DailyRecipeState();
      final newState = state.copyWith(status: RequestStatus.loading);
      expect(newState.status, RequestStatus.loading);
    });
    test('should create different instances with different status', () {
      const state = DailyRecipeState();
      final newState = state.copyWith(status: RequestStatus.loading);
      expect(newState, isNot(equals(state)));
    });
  });
}
