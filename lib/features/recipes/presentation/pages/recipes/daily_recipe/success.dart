import 'package:delishy/core/router/routes.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DailyRecipeSuccess extends StatelessWidget {
  const DailyRecipeSuccess({
    required this.meal,
    super.key,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Material(
      color: Theme.of(context).colorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        key: const Key('dailyRecipe_card'),
        borderRadius: BorderRadius.circular(32),
        onTap: () {
          context.push(
            Routes.recipeDetails,
            extra: meal,
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.recipe,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                l10n.ofTheDay,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 32),
              Text(
                meal.name,
                style: Theme.of(context).textTheme.headlineSmall,
                key: const Key('dailyRecipe_name'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (meal.area != null)
                    Row(
                      children: [
                        const Icon(Ionicons.globe_outline, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          meal.area ?? '',
                          style: Theme.of(context).textTheme.labelMedium,
                          key: const Key('dailyRecipe_area'),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  if (meal.category != null)
                    Row(
                      children: [
                        const Icon(Ionicons.fast_food_outline, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          meal.category ?? '',
                          style: Theme.of(context).textTheme.labelMedium,
                          key: const Key('dailyRecipe_category'),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: meal.thumb != null
                    ? Image.network(
                        meal.thumb!,
                        width: double.infinity,
                        height: 192,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Skeletonizer(
                            child: Container(
                              width: double.infinity,
                              height: 192,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          );
                        },
                      )
                    : Container(
                        width: double.infinity,
                        height: 192,
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
            ],
          ),
        ),
      ),
    );
  }
}
