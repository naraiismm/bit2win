import 'package:flutter_test/flutter_test.dart';
import 'package:impulse_app/main.dart';

void main() {
  testWidgets('HomePage displays key UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Check if "Partners:" text appears
    expect(find.text('Partners:'), findsOneWidget);

    // Check if partner names are displayed
    expect(find.text('Coca-Cola, Nestlé, EcoFund'), findsOneWidget);

    // Check if bonus and weight information is displayed
    expect(find.text('Bonus Amount: 150 points'), findsOneWidget);
    expect(find.text('Trash Weight: 5.2 kg'), findsOneWidget);

    // Check if the "Generate QR Code" button is present
    expect(find.text('Generate QR Code'), findsOneWidget);
  });
}
