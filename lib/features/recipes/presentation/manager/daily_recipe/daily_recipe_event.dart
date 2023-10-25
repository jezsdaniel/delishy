part of 'daily_recipe_bloc.dart';

abstract class DailyRecipeEvent extends Equatable {
  const DailyRecipeEvent();

  @override
  List<Object> get props => [];
}

class DailyRecipeRequested extends DailyRecipeEvent {
  const DailyRecipeRequested();
}
