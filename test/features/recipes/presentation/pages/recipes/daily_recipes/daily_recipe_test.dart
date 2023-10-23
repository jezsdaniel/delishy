import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc_mock.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/daily_recipe.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/failure.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/loading.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe/success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../../helpers/helpers.dart';
import '../../../../data/mocks/random_meal.dart';

void main() {
  group('DailyRecipe', () {
    testWidgets('renders DailyRecipeView', (tester) async {
      await tester.pumpApp(const DailyRecipe());
      expect(find.byType(DailyRecipeView), findsOneWidget);
    });
  });

  group('DailyRecipeView', () {
    testWidgets('should display loading skeleton when status is loading',
        (WidgetTester tester) async {
      final bloc = DailyRecipeBlocMock();
      when(() => bloc.state).thenReturn(
        const DailyRecipeState(status: RequestStatus.loading),
      );
      await tester.pumpApp(
        BlocProvider<DailyRecipeBloc>(
          create: (context) => bloc,
          child: const DailyRecipeView(),
        ),
      );
      expect(find.byType(DailyRecipeLoading), findsOneWidget);
    });
    testWidgets('should display failure when status is failure',
        (WidgetTester tester) async {
      final bloc = DailyRecipeBlocMock();
      when(() => bloc.state).thenReturn(
        const DailyRecipeState(status: RequestStatus.failure),
      );
      await tester.pumpApp(
        BlocProvider<DailyRecipeBloc>(
          create: (context) => bloc,
          child: const DailyRecipeView(),
        ),
      );
      expect(find.byType(DailyRecipeFailure), findsOneWidget);
    });
    testWidgets('should display success when status is success',
        (WidgetTester tester) async {
      final bloc = DailyRecipeBlocMock();
      when(() => bloc.state).thenReturn(
        DailyRecipeState(
          status: RequestStatus.success,
          meal: randomMealEntityMock.meal,
        ),
      );
      await mockNetworkImagesFor(
        () => tester.pumpApp(
          BlocProvider<DailyRecipeBloc>(
            create: (context) => bloc,
            child: const DailyRecipeView(),
          ),
        ),
      );
      expect(find.byType(DailyRecipeSuccess), findsOneWidget);
    });
  });
}
