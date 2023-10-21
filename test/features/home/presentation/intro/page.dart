import 'package:delishy/features/home/presentation/pages/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('IntroPage', () {
    testWidgets('renders IntroView', (tester) async {
      await tester.pumpApp(const IntroPage());
      expect(find.byType(IntroView), findsOneWidget);
    });
  });

  group('IntroView', () {
    testWidgets('renders title', (tester) async {
      await tester.pumpApp(const IntroView());
      expect(find.byKey(const Key('introView_title')), findsOneWidget);
    });
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const IntroView());
      expect(find.byType(Image), findsOneWidget);
    });
    testWidgets('renders description', (tester) async {
      await tester.pumpApp(const IntroView());
      expect(find.byKey(const Key('introView_description')), findsOneWidget);
    });
    testWidgets('renders button', (tester) async {
      await tester.pumpApp(const IntroView());
      expect(find.byType(FilledButton), findsOneWidget);
    });
    testWidgets('renders widgets on small screen', (tester) async {
      tester.view.physicalSize = const Size(320, 480);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      await tester.pumpApp(const IntroView());
      expect(find.byKey(const Key('introView_title')), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byKey(const Key('introView_description')), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });
  });
}
