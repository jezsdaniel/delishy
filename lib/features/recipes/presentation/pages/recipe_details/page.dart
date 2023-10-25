import 'package:delishy/core/network/request_status.dart';
import 'package:delishy/core/theme/colors.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    required this.recipe,
    super.key,
  });

  final Meal recipe;

  @override
  Widget build(BuildContext context) {
    return RecipeDetailsView(recipe: recipe);
  }
}

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({
    required this.recipe,
    super.key,
  });

  final Meal recipe;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(recipe.name),
            titleTextStyle: Theme.of(context).textTheme.displaySmall,
            actions: [
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state.status == RequestStatus.loading) {
                    return const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return IconButton(
                    onPressed: () {
                      context
                          .read<FavoritesBloc>()
                          .add(FavoritesEventToggle(recipe));
                    },
                    icon: state.favorites.contains(recipe)
                        ? const Icon(
                            Ionicons.star,
                            color: AppColors.earthYellow,
                          )
                        : const Icon(Ionicons.star_outline),
                    key: const Key('recipeDetails_favoriteIconButton'),
                  );
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: recipe.thumb != null
                        ? Image.network(
                            recipe.thumb!,
                            height: 256,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Skeletonizer(
                                child: Container(
                                  width: double.infinity,
                                  height: 256,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              );
                            },
                          )
                        : Container(
                            key: const Key('recipeDetails_noImage'),
                            width: double.infinity,
                            height: 256,
                            color: Theme.of(context).colorScheme.surface,
                            child: Center(
                              child: Icon(
                                Ionicons.fast_food_outline,
                                size: 64,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      if (recipe.area != null)
                        Row(
                          key: const Key('recipeDetails_area'),
                          children: [
                            const Icon(Ionicons.globe_outline),
                            const SizedBox(width: 4),
                            Text(
                              recipe.area ?? '',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),
                      if (recipe.category != null)
                        Row(
                          key: const Key('recipeDetails_category'),
                          children: [
                            const Icon(Ionicons.fast_food_outline),
                            const SizedBox(width: 4),
                            Text(
                              recipe.category ?? '',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                if (recipe.tags.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    key: const Key('recipeDetails_tags'),
                    child: Wrap(
                      children: [
                        for (final tag in recipe.tags)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: Chip(
                              label: Text(
                                tag,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                                side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                              ),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                      ],
                    ),
                  ),
                if (recipe.ingredients.isNotEmpty)
                  Column(
                    key: const Key('recipeDetails_ingredients'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        child: Text(
                          l10n.ingredients,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < recipe.ingredients.length; i++)
                              Text(
                                '${recipe.ingredients[i]}${recipe.measures.length > i ? ' - ${recipe.measures[i]}' : ''}',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.start,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                if (recipe.instructions != null &&
                    recipe.instructions!.isNotEmpty)
                  Column(
                    key: const Key('recipeDetails_instructions'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        child: Text(
                          l10n.instructions,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          recipe.instructions ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
