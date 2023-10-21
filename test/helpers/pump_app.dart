import 'package:delishy/core/router/router.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

String getRouterKey(String route) {
  return 'key_$route';
}

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
    const initialLocation = '/_initial';

    final router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: initialLocation,
          builder: (context, state) => widget,
        ),
        ...Routes().props.map(
              (e) => GoRoute(
                path: e! as String,
                builder: (context, state) => Container(
                  key: Key(
                    getRouterKey(e as String),
                  ),
                ),
              ),
            ),
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
