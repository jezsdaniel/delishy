import 'package:delishy/features/recipes/presentation/pages/recipes/app_bar.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  group('RecipesView', () {
    testWidgets('renders RecipesAppBar', (tester) async {
      await tester.pumpRouterApp(const RecipesView());
      expect(find.byType(RecipesAppBar), findsOneWidget);
    });
    testWidgets('renders DailyRecipe', (tester) async {
      await tester.pumpRouterApp(const RecipesView());
      expect(find.byType(DailyRecipe), findsOneWidget);
    });
  });
}
