import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/core/use_cases/use_case.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:delishy/features/recipes/domain/use_cases/get_random_meal.dart';
import 'package:equatable/equatable.dart';

part 'daily_recipe_event.dart';

part 'daily_recipe_state.dart';

class DailyRecipeBloc extends Bloc<DailyRecipeEvent, DailyRecipeState> {
  DailyRecipeBloc(
    this._getRandomMealUseCase,
  ) : super(const DailyRecipeState()) {
    on<DailyRecipeRequested>(_onDailyRecipeRequested);
  }

  final GetRandomMealUseCase _getRandomMealUseCase;

  Future<void> _onDailyRecipeRequested(
    DailyRecipeRequested event,
    Emitter<DailyRecipeState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final resp = await _getRandomMealUseCase(NoParams());
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
            meal: r.meal,
          ),
        );
      },
    );
  }
}
