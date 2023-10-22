import 'package:delishy/features/home/presentation/pages/coming_soon/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('ComingSoonPage', () {
    testWidgets('renders ComingSoonView', (tester) async {
      await tester.pumpApp(const ComingSoonPage());
      expect(find.byType(ComingSoonView), findsOneWidget);
    });
  });

  group('ComingSoonView', () {
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const ComingSoonView());
      expect(find.byType(Image), findsOneWidget);
    });
    testWidgets('renders title', (tester) async {
      await tester.pumpApp(const ComingSoonView());
      expect(find.byKey(const Key('comingSoonView_title')), findsOneWidget);
    });
    testWidgets('renders subtitle', (tester) async {
      await tester.pumpApp(const ComingSoonView());
      expect(find.byKey(const Key('comingSoonView_subtitle')), findsOneWidget);
    });
  });
}
