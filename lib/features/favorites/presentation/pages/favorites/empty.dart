import 'package:delishy/core/constants/assets.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          AssetsPaths.youngManWritingImage,
          height: 192,
        ),
        const SizedBox(
          width: double.infinity,
          height: 24,
        ),
        Text(
          l10n.noFavoriteRecipesYet,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
          key: const Key('favoritesEmpty_message'),
        ),
        const Spacer(),
      ],
    );
  }
}
