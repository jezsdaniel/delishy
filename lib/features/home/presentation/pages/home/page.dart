import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: const Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Ionicons.bulb_outline),
            label: l10n.recipes,
          ),
          NavigationDestination(
            icon: const Icon(Ionicons.list_outline),
            label: l10n.favorites,
          ),
          NavigationDestination(
            icon: const Icon(Ionicons.restaurant_outline),
            label: l10n.cookNow,
          ),
          NavigationDestination(
            icon: const Icon(Ionicons.settings_outline),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }
}
