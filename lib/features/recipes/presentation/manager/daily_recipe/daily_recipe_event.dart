part of 'daily_recipe_bloc.dart';

abstract class DailyRecipeEvent extends Equatable {
  const DailyRecipeEvent();
}

class DailyRecipeRequested extends DailyRecipeEvent {
  const DailyRecipeRequested();

  @override
  List<Object> get props => [];
}
