import 'package:delishy/core/router/routes.dart';
import 'package:delishy/features/cook/presentation/pages/cook/page.dart';
import 'package:delishy/features/favorites/presentation/pages/favorites/page.dart';
import 'package:delishy/features/home/presentation/pages/home/page.dart';
import 'package:delishy/features/recipes/presentation/pages/recipes/page.dart';
import 'package:delishy/features/settings/presentation/pages/settings/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpRouterAppLocation(Routes.recipes);
      await tester.pumpAndSettle();
      expect(find.byType(HomeView), findsOneWidget);
    });
  });

  group('HomeView', () {
    testWidgets('renders bottom navigation bar', (tester) async {
      await tester.pumpRouterAppLocation(Routes.recipes);
      await tester.pumpAndSettle();
      expect(find.byType(NavigationBar), findsOneWidget);
    });
  });

  group('RecipesTab', () {
    testWidgets('renders recipes tab', (tester) async {
      await tester.pumpRouterAppLocation(Routes.recipes);
      await tester.pumpAndSettle();
      expect(find.byType(RecipesPage), findsOneWidget);
    });
    testWidgets(
        'tapping on recipes navigation item while on recipes page does nothing',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.recipes);
      await tester.ensureVisible(find.byType(RecipesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_recipesItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(RecipesPage), findsOneWidget);
    });
    testWidgets(
        'tapping on favorites navigation item while on recipes page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.recipes);
      await tester.ensureVisible(find.byType(RecipesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_favoritesItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesPage), findsOneWidget);
      expect(find.byType(RecipesPage), findsNothing);
    });
    testWidgets(
        'tapping on cook now navigation item while on recipes page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.recipes);
      await tester.ensureVisible(find.byType(RecipesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_cookNowItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CookPage), findsOneWidget);
      expect(find.byType(RecipesPage), findsNothing);
    });
    testWidgets(
        'tapping on settings navigation item while on recipes page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.recipes);
      await tester.ensureVisible(find.byType(RecipesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_settingsItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.byType(RecipesPage), findsNothing);
    });
  });

  group('FavoritesTab', () {
    testWidgets('renders favorites tab', (tester) async {
      await tester.pumpRouterAppLocation(Routes.favorites);
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesPage), findsOneWidget);
    });
    testWidgets(
        'tapping on favorites navigation item while on favorites page does nothing',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.favorites);
      await tester
          .ensureVisible(find.byType(FavoritesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_favoritesItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesPage), findsOneWidget);
    });
    testWidgets(
        'tapping on recipes navigation item while on favorites page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.favorites);
      await tester
          .ensureVisible(find.byType(FavoritesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_recipesItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(RecipesPage), findsOneWidget);
      expect(find.byType(FavoritesPage), findsNothing);
    });
    testWidgets(
        'tapping on cook now navigation item while on favorites page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.favorites);
      await tester
          .ensureVisible(find.byType(FavoritesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_cookNowItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CookPage), findsOneWidget);
      expect(find.byType(FavoritesPage), findsNothing);
    });
    testWidgets(
        'tapping on settings navigation item while on favorites page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.favorites);
      await tester
          .ensureVisible(find.byType(FavoritesPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_settingsItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.byType(FavoritesPage), findsNothing);
    });
  });

  group('CookTab', () {
    testWidgets('renders cook tab', (tester) async {
      await tester.pumpRouterAppLocation(Routes.cookNow);
      await tester.pumpAndSettle();
      expect(find.byType(CookPage), findsOneWidget);
    });
    testWidgets(
        'tapping on cook navigation item while on cook page does nothing',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.cookNow);
      await tester.ensureVisible(find.byType(CookPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_cookNowItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CookPage), findsOneWidget);
    });
    testWidgets(
        'tapping on recipes navigation item while on cook page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.cookNow);
      await tester.ensureVisible(find.byType(CookPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_recipesItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(RecipesPage), findsOneWidget);
      expect(find.byType(CookPage), findsNothing);
    });
    testWidgets(
        'tapping on favorites navigation item while on cook page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.cookNow);
      await tester.ensureVisible(find.byType(CookPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_favoritesItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesPage), findsOneWidget);
      expect(find.byType(CookPage), findsNothing);
    });
    testWidgets(
        'tapping on settings navigation item while on cook page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.cookNow);
      await tester.ensureVisible(find.byType(CookPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_settingsItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.byType(CookPage), findsNothing);
    });
  });

  group('SettingsTab', () {
    testWidgets('renders cook tab', (tester) async {
      await tester.pumpRouterAppLocation(Routes.settings);
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
    });
    testWidgets(
        'tapping on settings navigation item while on settings page does nothing',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.settings);
      await tester
          .ensureVisible(find.byType(SettingsPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_settingsItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
    });
    testWidgets(
        'tapping on recipes navigation item while on settings page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.settings);
      await tester
          .ensureVisible(find.byType(SettingsPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_recipesItem'), skipOffstage: false),
      );
      await tester.pumpAndSettle();
      expect(find.byType(RecipesPage), findsOneWidget);
      expect(find.byType(SettingsPage), findsNothing);
    });
    testWidgets(
        'tapping on favorites navigation item while on settings page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.settings);
      await tester
          .ensureVisible(find.byType(SettingsPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_favoritesItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesPage), findsOneWidget);
      expect(find.byType(SettingsPage), findsNothing);
    });
    testWidgets(
        'tapping on cook navigation item while on settings page navigates',
        (tester) async {
      await tester.pumpRouterAppLocation(Routes.settings);
      await tester
          .ensureVisible(find.byType(SettingsPage, skipOffstage: false));
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('homeView_cookNowItem')),
      );
      await tester.pumpAndSettle();
      expect(find.byType(CookPage), findsOneWidget);
      expect(find.byType(SettingsPage), findsNothing);
    });
  });
}
