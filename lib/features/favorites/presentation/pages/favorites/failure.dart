import 'package:delishy/core/constants/assets.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesFailure extends StatelessWidget {
  const FavoritesFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 32),
          Image.asset(
            AssetsPaths.errorWarningIcon,
            height: 92,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.oopsSomethingWentWrong,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
            key: const Key('favoritesFailure_message'),
          ),
          const SizedBox(height: 32),
          FilledButton.tonal(
            key: const Key('favoritesFailure_tryAgainButton'),
            onPressed: () {
              context
                  .read<FavoritesBloc>()
                  .add(const FavoritesEventSubscriptionRequested());
            },
            child: Text(
              l10n.tryAgain,
            ),
          ),
        ],
      ),
    );
  }
}
