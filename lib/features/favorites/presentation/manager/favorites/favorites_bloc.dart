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
    on<FavoritesEventAdd>(_onFavoritesEventAdd);
    on<FavoritesEventRemove>(_onFavoritesEventRemove);
    on<FavoritesEventGetAll>(_onFavoritesEventGetAll);
  }

  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;

  Future<void> _onFavoritesEventAdd(
    FavoritesEventAdd event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final resp = await _addFavoriteUseCase(Params(event.meal));
    resp.fold(
      (l) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            error: l.message,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            favorites: [event.meal, ...state.favorites],
          ),
        );
      },
    );
  }

  Future<void> _onFavoritesEventRemove(
    FavoritesEventRemove event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final resp = await _removeFavoriteUseCase(Params(event.meal));
    resp.fold(
      (l) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            error: l.message,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            favorites:
                state.favorites.where((e) => e.id != event.meal.id).toList(),
          ),
        );
      },
    );
  }

  Future<void> _onFavoritesEventGetAll(
    FavoritesEventGetAll event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final resp = await _getAllFavoritesUseCase(NoParams());
    resp.fold(
      (l) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            error: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            favorites: r,
          ),
        );
      },
    );
  }
}
