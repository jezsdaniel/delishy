import 'package:delishy/core/constants/assets.dart';
import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonView();
  }
}

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
            key: const Key('comingSoonView_title'),
            'Cooking Up Something Special',
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          Text(
            key: const Key('comingSoonView_subtitle'),
            'Coming Soon!',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
