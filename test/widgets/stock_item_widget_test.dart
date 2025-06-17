import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:bstock/feature/stocks/presentation/widgets/stock_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StockItemWidget shows gain indicator for positive change', (tester) async {
    const stock = StockEntity(
      open: 100,
      close: 150,
      date: '2023-07-27T00:00:00Z',
      symbol: 'AAPL',
      company: 'Apple',
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: StockItemWidget(stock: stock)),
    ));

    expect(find.byIcon(Icons.arrow_drop_up), findsOneWidget);
    final percentageText = tester.widget<Text>(find.text('50%'));
    expect(percentageText.style?.color, Colors.green);
    expect(find.text('As at 27 Jul, 2023'), findsOneWidget);
  });
}
