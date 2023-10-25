import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:delishy/core/errors/failure.dart';
import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/core/use_cases/use_case.dart';
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
    });

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesState.loading, FavoritesState.success] when FavoritesEventAdd is added',
      build: () {
        when(() => mockAddFavoriteUseCase(const Params(mockMeal))).thenAnswer(
          (_) async => const Right<Failure, int>(1),
        );
        return favoritesBloc;
      },
      act: (bloc) => bloc.add(const FavoritesEventAdd(mockMeal)),
      expect: () => [
        const FavoritesState(status: RequestStatus.loading),
        const FavoritesState(
          status: RequestStatus.success,
          favorites: [mockMeal],
        ),
      ],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesState.loading, FavoritesState.success] when FavoritesEventRemove is added',
      build: () {
        when(() => mockRemoveFavoriteUseCase(const Params(mockMeal)))
            .thenAnswer(
          (_) async => const Right<Failure, int>(1),
        );
        return favoritesBloc;
      },
      act: (bloc) => bloc.add(const FavoritesEventRemove(mockMeal)),
      expect: () => [
        const FavoritesState(status: RequestStatus.loading),
        const FavoritesState(
          status: RequestStatus.success,
        ),
      ],
    );

    blocTest<FavoritesBloc, FavoritesState>(
      'emits [FavoritesState.loading, FavoritesState.success] when FavoritesEventGetAll is added',
      build: () {
        when(() => mockGetAllFavoritesUseCase(NoParams())).thenAnswer(
          (_) async => const Right<Failure, List<Meal>>([mockMeal]),
        );
        return favoritesBloc;
      },
      act: (bloc) => bloc.add(const FavoritesEventGetAll()),
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
