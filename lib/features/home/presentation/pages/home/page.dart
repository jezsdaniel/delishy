import 'package:animate_do/animate_do.dart';
import 'package:delishy/core/di/injector.dart';
import 'package:delishy/features/favorites/presentation/manager/favorites/favorites_bloc.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.child,
    super.key,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc(
        Injector.getIt!.get(),
        Injector.getIt!.get(),
        Injector.getIt!.get(),
      )..add(const FavoritesEventSubscriptionRequested()),
      child: HomeView(
        child: child,
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({
    required this.child,
    super.key,
  });

  final StatefulNavigationShell child;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: SlideInUp(
        child: NavigationBar(
          selectedIndex: widget.child.currentIndex,
          onDestinationSelected: (index) {
            widget.child.goBranch(
              index,
              initialLocation: index == widget.child.currentIndex,
            );
            setState(() {});
          },
          destinations: [
            NavigationDestination(
              key: const Key('homeView_recipesItem'),
              icon: const Icon(Ionicons.bulb_outline),
              label: l10n.recipes,
            ),
            NavigationDestination(
              key: const Key('homeView_favoritesItem'),
              icon: const Icon(Ionicons.list_outline),
              label: l10n.favorites,
            ),
            NavigationDestination(
              key: const Key('homeView_cookNowItem'),
              icon: const Icon(Ionicons.restaurant_outline),
              label: l10n.cookNow,
            ),
            NavigationDestination(
              key: const Key('homeView_settingsItem'),
              icon: const Icon(Ionicons.settings_outline),
              label: l10n.settings,
            ),
          ],
        ),
      ),
    );
  }
}
