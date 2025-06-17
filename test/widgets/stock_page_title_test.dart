import 'package:bstock/feature/stocks/presentation/widgets/stock_page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StocksTitleWidget renders title', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: StocksTitleWidget()),
    ));

    expect(find.textContaining('Portfolio'), findsOneWidget);
  });
}
