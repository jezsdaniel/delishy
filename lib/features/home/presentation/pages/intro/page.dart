import 'package:delishy/core/constants/assets.dart';
import 'package:delishy/core/router/routes.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntroView();
  }
}

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Text(
                l10n.appName,
                style: Theme.of(context).textTheme.titleMedium,
                key: const Key('introView_title'),
              ),
              const Spacer(),
              Image.asset(
                AssetsPaths.cuttingBoardImage,
                height: 192,
              ),
              const SizedBox(
                width: double.infinity,
                height: 16,
              ),
              Text(
                l10n.allTheRecipesOnYourFingertips,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
                key: const Key('introView_description'),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () {
                    context.go(Routes.recipes);
                  },
                  child: Text(l10n.letsStart),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
