import 'package:bstock/feature/stocks/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoadingWidget shows CircularProgressIndicator', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: LoadingWidget()),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
