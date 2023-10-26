import 'package:delishy/features/favorites/presentation/pages/favorites/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  group('FavoritesEmpty', () {
    testWidgets('renders daily recipe name', (tester) async {
      await tester.pumpApp(const FavoritesEmpty());
      expect(find.byKey(const Key('favoritesEmpty_message')), findsOneWidget);
    });
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const FavoritesEmpty());
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
