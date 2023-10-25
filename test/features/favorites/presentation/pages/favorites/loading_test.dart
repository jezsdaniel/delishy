import 'package:delishy/features/favorites/presentation/pages/favorites/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';


void main() {
  group('FavoritesLoading', () {
    testWidgets('renders daily recipe name', (tester) async {
      await tester.pumpApp(const FavoritesLoading());
      expect(find.byKey(const Key('favoritesLoading_name')), findsOneWidget);
    });
    testWidgets('renders daily recipe area', (tester) async {
      await tester.pumpApp(const FavoritesLoading());
      expect(find.byKey(const Key('favoritesLoading_area')), findsOneWidget);
    });
    testWidgets('renders daily recipe category', (tester) async {
      await tester.pumpApp(const FavoritesLoading());
      expect(
          find.byKey(const Key('favoritesLoading_category')), findsOneWidget);
    });
    testWidgets('renders image', (tester) async {
      await tester.pumpApp(const FavoritesLoading());
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
