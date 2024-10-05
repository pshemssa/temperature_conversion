import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:TempConversionApp/main.dart'; // Ensure this is the correct path

void main() {
  testWidgets('Temperature Conversion App Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const TempConversionApp());

    // Verify if the initial elements are present.
    expect(find.text('Temperature Conversion'), findsOneWidget);
    expect(find.text('Enter temperature'), findsOneWidget);
    expect(find.text('Convert'), findsOneWidget);

    // Test temperature conversion from Fahrenheit to Celsius
    await tester.enterText(find.byType(TextField), '100');
    await tester.tap(find.text('Fahrenheit to Celsius'));
    await tester.tap(find.text('Convert'));
    await tester.pump();

    // Verify the result
    expect(find.text('Result: 37.78'), findsOneWidget);

    // Test temperature conversion from Celsius to Fahrenheit
    await tester.enterText(find.byType(TextField), '0');
    await tester.tap(find.text('Celsius to Fahrenheit'));
    await tester.tap(find.text('Convert'));
    await tester.pump();

    // Verify the result
    expect(find.text('Result: 32.00'), findsOneWidget);

    // Verify the history
    expect(find.text('F to C: 100.0 => 37.78'), findsOneWidget);
    expect(find.text('C to F: 0.0 => 32.00'), findsOneWidget);
  });
}