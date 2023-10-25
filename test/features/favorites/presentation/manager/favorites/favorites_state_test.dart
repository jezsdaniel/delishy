import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FavoritesState', () {
    test('supports value equality', () {
      expect(const FavoritesState(), equals(const FavoritesState()));
    });
    test('should return a copy with updated status', () {
      const state = FavoritesState();
      final newState = state.copyWith(status: RequestStatus.loading);
      expect(newState.status, RequestStatus.loading);
    });
    test('should create different instances with different status', () {
      const state = FavoritesState();
      final newState = state.copyWith(status: RequestStatus.loading);
      expect(newState, isNot(equals(state)));
    });
  });
}
