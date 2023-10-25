import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/core/use_cases/use_case.dart';
import 'package:delishy/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:delishy/features/favorites/domain/use_cases/add_favorite.dart';
import 'package:delishy/features/favorites/domain/use_cases/get_all_favorites.dart';
import 'package:delishy/features/favorites/domain/use_cases/remove_favorite.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddFavoriteUseCase extends Mock implements AddFavoriteUseCase {}

class MockRemoveFavoriteUseCase extends Mock implements RemoveFavoriteUseCase {}

class MockGetAllFavoritesUseCase extends Mock
    implements GetAllFavoritesUseCase {}

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

void main() {
  group('FavoritesBloc', () {
    const mockMeal = Meal(id: '1', name: 'Test Meal');
    late FavoritesBloc favoritesBloc;

    final mockAddFavoriteUseCase = MockAddFavoriteUseCase();
    final mockRemoveFavoriteUseCase = MockRemoveFavoriteUseCase();
    final mockGetAllFavoritesUseCase = MockGetAllFavoritesUseCase();

    setUp(() {
      favoritesBloc = FavoritesBloc(
        mockAddFavoriteUseCase,
        mockRemoveFavoriteUseCase,
        mockGetAllFavoritesUseCase,
      );
      registerFallbackValue(const Params(mockMeal));
      when(() => mockAddFavoriteUseCase(any())).thenAnswer((_) async {
        return const Right(1);
      });
      when(() => mockRemoveFavoriteUseCase(any())).thenAnswer((_) async {
        return const Right(1);
      });
    });

    blocTest<FavoritesBloc, FavoritesState>(
      'saves favorite when is not already on the favorites',
      build: () => favoritesBloc,
      act: (bloc) => bloc.add(
        const FavoritesEventToggle(mockMeal),
      ),
      verify: (_) {
        verify(
          () => mockAddFavoriteUseCase(
            const Params(mockMeal),
          ),
        ).called(1);
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'saves favorite when is not already on the favorites',
      build: () => favoritesBloc,
      seed: () => const FavoritesState(favorites: [mockMeal]),
      act: (bloc) => bloc.add(
        const FavoritesEventToggle(mockMeal),
      ),
      verify: (_) {
        verify(
          () => mockRemoveFavoriteUseCase(
            const Params(mockMeal),
          ),
        ).called(1);
      },
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesState.loading, FavoritesState.success] when FavoritesEventSubscriptionRequested is added',
      build: () {
        final streamController = StreamController<List<Meal>>();
        streamController.sink.add([mockMeal]);
        when(() => mockGetAllFavoritesUseCase(NoParams())).thenAnswer(
          (_) async =>
              Right<Failure, Stream<List<Meal>>>(streamController.stream),
        );
        return favoritesBloc;
      },
      act: (bloc) => bloc.add(const FavoritesEventSubscriptionRequested()),
      expect: () => [
        const FavoritesState(status: RequestStatus.loading),
        const FavoritesState(
          status: RequestStatus.success,
          favorites: [mockMeal],
        ),
      ],
    );
  });
}
