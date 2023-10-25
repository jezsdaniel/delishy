part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  const FavoritesState({
    this.favorites = const [],
    this.status = RequestStatus.initial,
    this.error = '',
  });

  final List<Meal> favorites;
  final RequestStatus status;
  final String error;

  FavoritesState copyWith({
    List<Meal>? favorites,
    RequestStatus? status,
    String? error,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        favorites,
        status,
        error,
      ];
}
