import 'package:bstock/feature/stocks/presentation/widgets/highest_lowest_stock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HighLowStockWidget highest displays green value', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HighLowStockWidget(
          value: '120',
          company: 'Apple, AAPL',
          stockStatus: StockStatus.highest,
        ),
      ),
    ));

    final text = tester.widget<Text>(find.text('120'));
    expect(text.style?.color, Colors.green);
    expect(find.text('HIGHEST'), findsOneWidget);
  });

  testWidgets('HighLowStockWidget lowest displays red value', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HighLowStockWidget(
          value: '80',
          company: 'Apple, AAPL',
          stockStatus: StockStatus.lowest,
        ),
      ),
    ));

    final text = tester.widget<Text>(find.text('80'));
    expect(text.style?.color, Colors.red);
    expect(find.text('LOWEST'), findsOneWidget);
  });
}
