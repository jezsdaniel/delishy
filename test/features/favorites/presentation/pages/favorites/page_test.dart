import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/daily_recipe_bloc_mock.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/features/favorites/presentation/pages/favorites/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  group('FavoritesPage', () {
    testWidgets('renders FavoritesView', (tester) async {
      final mockBloc = FavoritesBlocMock();
      when(() => mockBloc.state).thenReturn(
        const FavoritesState(status: RequestStatus.success),
      );
      await tester.pumpApp(
        BlocProvider<FavoritesBloc>(
          create: (context) => mockBloc,
          child: const FavoritesPage(),
        ),
      );
      expect(find.byType(FavoritesView), findsOneWidget);
    });
  });

  group('FavoritesView', () {
    testWidgets('renders FavoritesAppBar', (tester) async {
      final mockBloc = FavoritesBlocMock();
      when(() => mockBloc.state).thenReturn(
        const FavoritesState(status: RequestStatus.success),
      );
      await tester.pumpApp(
        BlocProvider<FavoritesBloc>(
          create: (context) => mockBloc,
          child: const FavoritesView(),
        ),
      );
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
