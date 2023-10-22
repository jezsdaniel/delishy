import 'package:delishy/core/router/router.dart';
import 'package:delishy/core/theme/theme.dart';
import 'package:delishy/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppNavigation.instance;
    return MaterialApp.router(
      routerConfig: AppNavigation.router,
      theme: appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
