part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesEventToggle extends FavoritesEvent {
  const FavoritesEventToggle(this.meal);

  final Meal meal;

  @override
  List<Object> get props => [meal];
}

class FavoritesEventSubscriptionRequested extends FavoritesEvent {
  const FavoritesEventSubscriptionRequested();
}
