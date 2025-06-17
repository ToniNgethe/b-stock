import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:bstock/feature/stocks/presentation/stock_ui.dart';
import 'package:test/test.dart';

void main() {
  test('getPercentageChange returns correct value', () {
    final stock = StockEntity(open: 100.0, close: 150.0);
    expect(StockUi.getPercentageChange(stock), 50);
  });
}
