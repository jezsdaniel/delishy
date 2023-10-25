part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesEventAdd extends FavoritesEvent {
  const FavoritesEventAdd(this.meal);

  final Meal meal;

  @override
  List<Object> get props => [meal];
}

class FavoritesEventRemove extends FavoritesEvent {
  const FavoritesEventRemove(this.meal);

  final Meal meal;

  @override
  List<Object> get props => [meal];
}

class FavoritesEventGetAll extends FavoritesEvent {
  const FavoritesEventGetAll();
}
