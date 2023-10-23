import 'package:delishy/core/constants/assets.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyRecipeFailure extends StatelessWidget {
  const DailyRecipeFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            AssetsPaths.errorWarningIcon,
            height: 92,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.oopsSomethingWentWrong,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
            key: const Key('dailyRecipeFailure_message'),
          ),
          const SizedBox(height: 32),
          FilledButton.tonal(
            key: const Key('dailyRecipeFailure_tryAgainButton'),
            onPressed: () {
              context.read<DailyRecipeBloc>().add(const DailyRecipeRequested());
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
