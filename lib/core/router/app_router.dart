import 'package:delishy/core/router/routes.dart';
import 'package:delishy/features/home/presentation/pages/home/page.dart';
import 'package:delishy/features/home/presentation/pages/intro/page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  factory AppNavigation() {
    return _instance;
  }

  AppNavigation._internal() {
    final routes = [
      GoRoute(
        path: Routes.intro,
        builder: (_, __) => const IntroPage(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: recipesTabNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.recipes,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: Container(
                      child: Text('Recipes'),
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: favoritesTabNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.favorites,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: Container(
                      child: Text('Favorites'),
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: cookNowTabNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.cookNow,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: Container(
                      child: Text('Cook now'),
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsTabNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.settings,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: Container(
                      child: Text('Settings'),
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: HomePage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: Routes.intro,
      routes: routes,
    );
  }

  static Page<Widget> getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  static final AppNavigation _instance = AppNavigation._internal();

  static AppNavigation get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> recipesTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> favoritesTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> cookNowTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;
}
