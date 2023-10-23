import 'package:delishy/core/constants/assets.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DailyRecipeLoading extends StatelessWidget {
  const DailyRecipeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Skeletonizer(
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
              l10n.recipe,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              l10n.ofTheDay,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              l10n.roastedPumpkinSoup,
              style: Theme.of(context).textTheme.headlineSmall,
              key: const Key('dailyRecipeLoading_name'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Ionicons.globe_outline, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'meal area',
                      style: Theme.of(context).textTheme.labelMedium,
                      key: const Key('dailyRecipeLoading_area'),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Ionicons.fast_food_outline, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'meal category',
                      style: Theme.of(context).textTheme.labelMedium,
                      key: const Key('dailyRecipeLoading_category'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AssetsPaths.mealSampleImage,
                width: double.infinity,
                height: 192,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
