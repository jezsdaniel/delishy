import 'package:delishy/features/recipes/presentation/pages/recipes/app_bar.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/daily_recipe.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipesView();
  }
}

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    final l11n = context.l10n;
    return Scaffold(
      appBar: RecipesAppBar(
        titleText: l11n.appName,
        context: context,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          children: [
            DailyRecipe(),
          ],
        ),
      ),
    );
  }
}
