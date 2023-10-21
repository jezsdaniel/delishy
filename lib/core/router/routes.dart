import 'package:equatable/equatable.dart';

class Routes extends Equatable {
  static const intro = '/';

  static const home = '/home';

  @override
  List<Object?> get props => [intro, home];
}
