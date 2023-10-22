import 'package:delishy/core/constants/assets.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DailyRecipe extends StatelessWidget {
  const DailyRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
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
            key: const Key('dailyRecipe_name'),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Ionicons.time_outline, size: 16),
              const SizedBox(width: 4),
              Text(
                '50 ${l10n.min}',
                style: Theme.of(context).textTheme.labelMedium,
                key: const Key('dailyRecipe_time'),
              ),
              const SizedBox(width: 12),
              const Icon(Ionicons.fast_food_outline, size: 16),
              const SizedBox(width: 4),
              Text(
                '4 ${l10n.ppl}',
                style: Theme.of(context).textTheme.labelMedium,
                key: const Key('dailyRecipe_portions'),
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
    );
  }
}
