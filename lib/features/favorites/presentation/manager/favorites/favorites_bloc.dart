import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/core/use_cases/use_case.dart';
import 'package:delishy/features/favorites/domain/use_cases/add_favorite.dart';
import 'package:delishy/features/favorites/domain/use_cases/get_all_favorites.dart';
import 'package:delishy/features/favorites/domain/use_cases/remove_favorite.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:equatable/equatable.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(
    this._addFavoriteUseCase,
    this._removeFavoriteUseCase,
    this._getAllFavoritesUseCase,
  ) : super(const FavoritesState()) {
    on<FavoritesEventToggle>(_onFavoritesEventToggle);
    on<FavoritesEventSubscriptionRequested>(
        _onFavoritesEventSubscriptionRequested);
  }

  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;

  Future<void> _onFavoritesEventToggle(
    FavoritesEventToggle event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(
      state.copyWith(status: RequestStatus.loading),
    );
    if (state.favorites.contains(event.meal)) {
      await _onFavoritesEventRemove(event.meal, emit);
    } else {
      await _onFavoritesEventAdd(event.meal, emit);
    }
  }

  Future<void> _onFavoritesEventAdd(
    Meal meal,
    Emitter<FavoritesState> emit,
  ) async {
    final resp = await _addFavoriteUseCase(Params(meal));
    resp.fold(
      (l) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            error: l.message,
          ),
        );
      },
      (_) {},
    );
  }

  Future<void> _onFavoritesEventRemove(
    Meal meal,
    Emitter<FavoritesState> emit,
  ) async {
    final resp = await _removeFavoriteUseCase(Params(meal));
    resp.fold(
      (l) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            error: l.message,
          ),
        );
      },
      (_) {},
    );
  }

  Future<void> _onFavoritesEventSubscriptionRequested(
    FavoritesEventSubscriptionRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final resp = await _getAllFavoritesUseCase(NoParams());
    await resp.fold(
      (l) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            error: l.message,
          ),
        );
      },
      (r) async {
        await emit.forEach<List<Meal>>(
          r,
          onData: (favorites) => state.copyWith(
            status: RequestStatus.success,
            favorites: favorites,
          ),
          onError: (_, __) => state.copyWith(
            status: RequestStatus.failure,
          ),
        );
      },
    );
  }
}
