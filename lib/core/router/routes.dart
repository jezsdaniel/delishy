import 'package:equatable/equatable.dart';

class Routes extends Equatable {
  static const intro = '/';
  static const recipes = '/recipes';
  static const favorites = '/favorites';
  static const cookNow = '/cook-now';
  static const settings = '/settings';

  @override
  List<Object?> get props => [intro, recipes];
}
