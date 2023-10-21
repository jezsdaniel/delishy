import 'package:delishy/core/constants/constants.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
              ),
              const Spacer(),
              Image.asset(
                AssetsPaths.boyCookImage,
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
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () {},
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