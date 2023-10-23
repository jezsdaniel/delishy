import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc_mock.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../helpers/helpers.dart';

void main() {
  group('DailyRecipeFailure', () {
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const DailyRecipeFailure());
      expect(find.byType(Image), findsOneWidget);
    });
    testWidgets('renders error message', (tester) async {
      await tester.pumpApp(const DailyRecipeFailure());
      expect(
          find.byKey(const Key('dailyRecipeFailure_message')), findsOneWidget);
    });
    testWidgets('renders retry button', (tester) async {
      await tester.pumpApp(const DailyRecipeFailure());
      expect(
        find.byKey(const Key('dailyRecipeFailure_tryAgainButton')),
        findsOneWidget,
      );
    });
    testWidgets('tapping on retry button retries request', (tester) async {
      final mockBloc = DailyRecipeBlocMock();

      await tester.pumpApp(
        BlocProvider<DailyRecipeBloc>(
          create: (context) => mockBloc,
          child: const DailyRecipeFailure(),
        ),
      );

      await tester
          .tap(find.byKey(const Key('dailyRecipeFailure_tryAgainButton')));
      verify(() => mockBloc.add(const DailyRecipeRequested())).called(1);
    });
  });
}
