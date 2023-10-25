import 'package:delishy/features/favorites/presentation/manager/favorites/daily_recipe_bloc_mock.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/features/favorites/presentation/pages/favorites/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  group('FavoritesFailure', () {
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const FavoritesFailure());
      expect(find.byType(Image), findsOneWidget);
    });
    testWidgets('renders error message', (tester) async {
      await tester.pumpApp(const FavoritesFailure());
      expect(
          find.byKey(const Key('favoritesFailure_message')), findsOneWidget);
    });
    testWidgets('renders retry button', (tester) async {
      await tester.pumpApp(const FavoritesFailure());
      expect(
        find.byKey(const Key('favoritesFailure_tryAgainButton')),
        findsOneWidget,
      );
    });
    testWidgets('tapping on retry button retries request', (tester) async {
      final mockBloc = FavoritesBlocMock();

      await tester.pumpApp(
        BlocProvider<FavoritesBloc>(
          create: (context) => mockBloc,
          child: const FavoritesFailure(),
        ),
      );

      await tester
          .tap(find.byKey(const Key('favoritesFailure_tryAgainButton')));
      verify(() => mockBloc.add(const FavoritesEventSubscriptionRequested()))
          .called(1);
    });
  });
}
