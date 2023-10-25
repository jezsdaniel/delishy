import 'package:delishy/core/router/router.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesSuccess extends StatelessWidget {
  const FavoritesSuccess({
    required this.favorites,
    super.key,
  });

  final List<Meal> favorites;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 40,
      ),
      itemBuilder: (context, index) {
        return Material(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(32),
          child: InkWell(
            key: const Key('favorites_card'),
            borderRadius: BorderRadius.circular(32),
            onTap: () {
              context.push(
                Routes.recipeDetails,
                extra: favorites[index],
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 32,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favorites[index].name,
                    style: Theme.of(context).textTheme.headlineSmall,
                    key: const Key('favoritesSuccess_name'),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (favorites[index].area != null)
                        Row(
                          children: [
                            const Icon(Ionicons.globe_outline, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              favorites[index].area ?? '',
                              style: Theme.of(context).textTheme.labelMedium,
                              key: const Key('favoritesSuccess_area'),
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),
                      if (favorites[index].category != null)
                        Row(
                          children: [
                            const Icon(Ionicons.fast_food_outline, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              favorites[index].category ?? '',
                              style: Theme.of(context).textTheme.labelMedium,
                              key: const Key('favoritesSuccess_category'),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: favorites[index].thumb != null
                        ? Image.network(
                            favorites[index].thumb!,
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
      },
      separatorBuilder: (BuildContext context, _) {
        return const SizedBox(height: 16);
      },
      itemCount: favorites.length,
    );
  }
}
