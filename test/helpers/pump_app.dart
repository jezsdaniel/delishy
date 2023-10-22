import 'package:delishy/core/router/router.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }

  Future<void> pumpRouterApp(Widget widget) {
    AppNavigation.instance;

    const initialLocation = '/_initial';

    final router = GoRouter(
      navigatorKey: AppNavigation.parentNavigatorKey,
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: initialLocation,
          builder: (context, state) => widget,
        ),
        ...AppNavigation.router.configuration.routes,
      ],
    );

    return pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
  }

  Future<void> pumpRouterAppLocation(String initialLocation) {
    AppNavigation.instance;

    final router = GoRouter(
      navigatorKey: AppNavigation.parentNavigatorKey,
      initialLocation: initialLocation,
      routes: [
        ...AppNavigation.router.configuration.routes,
      ],
    );

    return pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
  }
}
