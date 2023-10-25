import 'package:bloc_test/bloc_test.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';

class FavoritesBlocMock extends MockBloc<FavoritesEvent, FavoritesState>
    implements FavoritesBloc {}
