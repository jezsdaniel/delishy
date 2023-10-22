import 'package:delishy/features/recipes/presentation/pages/recipes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('RecipesAppBar', () {
    testWidgets('renders RecipesAppBar', (tester) async {
      final context = MockBuildContext();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: RecipesAppBar(
              titleText: 'Delishy',
              context: context,
            ),
          ),
        ),
      );
      expect(find.byType(RecipesAppBar), findsOneWidget);
    });
    testWidgets('renders title and search icon', (tester) async {
      final context = MockBuildContext();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: RecipesAppBar(
              titleText: 'Delishy',
              context: context,
            ),
          ),
        ),
      );
      expect(find.text('Delishy'), findsOneWidget);
      expect(find.byIcon(Ionicons.search_outline), findsOneWidget);
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
