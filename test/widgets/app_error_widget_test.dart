import 'package:bstock/core/widgets/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppErrorWidget displays error text', (tester) async {
    const errorMessage = 'An error occurred';
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: AppErrorWidget(error: errorMessage)),
    ));

    expect(find.text(errorMessage), findsOneWidget);
  });
}
