import 'package:bstock/feature/stocks/presentation/stock_ui.dart';
import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StockUi helper methods', () {
    test('getPercentageChange returns correct difference', () {
      const entity = StockEntity(open: 100, close: 150);
      expect(StockUi.getPercentageChange(entity), 50);
    });

    test('formatDate returns formatted date', () {
      const date = '2023-07-27T00:00:00Z';
      expect(StockUi.formatDate(date), '27 Jul, 2023');
    });
  });
}
