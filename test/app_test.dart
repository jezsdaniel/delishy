import 'package:delishy/app.dart';
import 'package:delishy/features/home/presentation/pages/intro/page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders IntroPage', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      expect(find.byType(IntroPage), findsOneWidget);
    });
  });
}
