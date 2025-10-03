// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/data/portfolio_repository.dart';

void main() {
  testWidgets('renders owner name from repository', (
    WidgetTester tester,
  ) async {
    const PortfolioConfig config = PortfolioConfig(
      ownerName: 'Test User',
      image: 'assets/images/profile.png',
      email: 'test@example.com',
      github: 'github.com/test',
      linkedin: 'linkedin.com/in/test',
      phone: '+923176543210',
    );
    final PortfolioRepository repo = InMemoryPortfolioRepository(
      config: config,
    );

    await tester.pumpWidget(PortfolioApp(repository: repo));

    expect(find.text('Test User'), findsOneWidget);
  });
}
