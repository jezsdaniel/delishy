part of 'daily_recipe_bloc.dart';

class DailyRecipeState extends Equatable {
  const DailyRecipeState({
    this.meal = Meal.empty,
    this.status = RequestStatus.initial,
    this.error = '',
  });

  final Meal meal;
  final RequestStatus status;
  final String error;

  DailyRecipeState copyWith({
    Meal? meal,
    RequestStatus? status,
    String? error,
  }) {
    return DailyRecipeState(
      meal: meal ?? this.meal,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        meal,
        status,
        error,
      ];
}
