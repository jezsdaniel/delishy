import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/features/favorites/data/data_sources/favorites_local_api.dart';
import 'package:delishy/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoritesLocalStorage extends Mock implements FavoritesLocalStorage {}

void main() {
  group('FavoritesRepositoryImpl', () {
    late FavoritesLocalStorage mockLocalStorage;
    late FavoritesRepositoryImpl repository;

    setUpAll(() {
      mockLocalStorage = MockFavoritesLocalStorage();
      repository = FavoritesRepositoryImpl(mockLocalStorage);
    });

    group('addFavorite', () {
      test('should add a favorite meal', () async {
        const meal = Meal(id: '1', name: 'Test Meal');
        when(() => mockLocalStorage.addFavorite(meal))
            .thenAnswer((_) async => 1);

        final result = await repository.addFavorite(meal);

        expect(result, const Right<Failure, int>(1));
        verify(() => mockLocalStorage.addFavorite(meal)).called(1);
        verifyNoMoreInteractions(mockLocalStorage);
      });

      test('should return a failure when adding a favorite meal fails',
          () async {
        const meal = Meal(id: '1', name: 'Test Meal');
        when(() => mockLocalStorage.addFavorite(meal))
            .thenThrow(Exception('Failed'));

        final result = await repository.addFavorite(meal);

        expect(result, Left<Failure, int>(Failure()));
        verify(() => mockLocalStorage.addFavorite(meal)).called(1);
        verifyNoMoreInteractions(mockLocalStorage);
      });
    });

    group('removeFavorites', () {
      test('should remove a favorite meal', () async {
        const meal = Meal(id: '1', name: 'Test Meal');
        when(() => mockLocalStorage.removeFavorite(meal))
            .thenAnswer((_) async => 1);

        final result = await repository.removeFavorites(meal);

        expect(result, const Right<Failure, int>(1));
        verify(() => mockLocalStorage.removeFavorite(meal)).called(1);
        verifyNoMoreInteractions(mockLocalStorage);
      });

      test('should return a failure when removing a favorite meal fails',
          () async {
        const meal = Meal(id: '1', name: 'Test Meal');
        when(() => mockLocalStorage.removeFavorite(meal))
            .thenThrow(Exception('Failed'));

        final result = await repository.removeFavorites(meal);

        expect(result, Left<Failure, int>(Failure()));
        verify(() => mockLocalStorage.removeFavorite(meal)).called(1);
        verifyNoMoreInteractions(mockLocalStorage);
      });
    });

    group('getAllFavorites', () {
      test('should get all favorite meals', () async {
        final mockMeals = [const Meal(id: '1', name: 'Test Meal')];
        when(() => mockLocalStorage.getAllFavorites())
            .thenAnswer((_) async => mockMeals);

        final result = await repository.getAllFavorites();

        expect(result, Right<Failure, List<Meal>>(mockMeals));
        verify(() => mockLocalStorage.getAllFavorites()).called(1);
        verifyNoMoreInteractions(mockLocalStorage);
      });

      test('should return a failure when getting all favorite meals fails',
          () async {
        when(() => mockLocalStorage.getAllFavorites())
            .thenThrow(Exception('Failed'));

        final result = await repository.getAllFavorites();

        expect(result, Left<Failure, int>(Failure()));
        verify(() => mockLocalStorage.getAllFavorites()).called(1);
        verifyNoMoreInteractions(mockLocalStorage);
      });
    });
  });
}
