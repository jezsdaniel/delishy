import 'package:delishy/features/favorites/presentation/pages/favorites/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';


void main() {
  group('FavoritesLoading', () {
    testWidgets('renders and empty box', (tester) async {
      await tester.pumpApp(const FavoritesLoading());
      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}
