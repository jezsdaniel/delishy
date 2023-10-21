import 'package:delishy/core/router/routes.dart';
import 'package:delishy/features/home/presentation/pages/home/page.dart';
import 'package:delishy/features/home/presentation/pages/intro/page.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter([String? initialLocation]) => GoRouter(
      routes: [
        GoRoute(
          path: Routes.intro,
          builder: (_, __) => const IntroPage(),
        ),
        GoRoute(
          path: Routes.home,
          builder: (_, __) => const HomePage(),
        ),
      ],
    );
