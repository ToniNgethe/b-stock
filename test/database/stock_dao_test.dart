import 'package:bstock/core/database/database.dart';
import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:test/test.dart';

void main() {
  group('StockDao Test', () {
    late AppDatabase database;

    setUpAll(() async {
      database = await $FloorAppDatabase
          .databaseBuilder('app_database_stock.db')
          .build();
    });

    tearDownAll(() async {
      database.close();
    });

    test('test insertAll', () async {
      final stockDao = database.stockDao;

      // Insert multiple stocks
      final stocks = [
        StockEntity(
            id: 1,
            open: 100.1,
            close: 150.6,
            high: 200.3,
            low: 50.2,
            date: '2023-07-27',
            symbol: 'TST',
            company: 'Test Company 1'),
        StockEntity(
            id: 2,
            open: 200.1,
            close: 250.6,
            high: 300.3,
            low: 150.2,
            date: '2023-07-27',
            symbol: 'TST2',
            company: 'Test Company 2'),
      ];
      await stockDao.insertAll(stocks);

      // Fetch all stocks
      final fetchedStocks = await stockDao.fetchAllStocks();

      // Verify the results
      expect(fetchedStocks, containsAll(stocks));
    });

    test('test fetchAllStocks', () async {
      final stockDao = database.stockDao;

      // Insert a stock
      final stock = StockEntity(
          id: 1,
          open: 100.1,
          close: 150.6,
          high: 200.3,
          low: 50.2,
          date: '2023-07-27',
          symbol: 'TST',
          company: 'Test Company');
      await stockDao.insertAll([stock]);

      // Fetch all stocks
      final stocks = await stockDao.fetchAllStocks();

      // Verify the results
      expect(stocks, contains(stock));
    });

    test('test nuke', () async {
      final stockDao = database.stockDao;

      // Insert a stock
      final stock = StockEntity(
          id: 1,
          open: 100.1,
          close: 150.6,
          high: 200.3,
          low: 50.2,
          date: '2023-07-27',
          symbol: 'TST',
          company: 'Test Company');
      await stockDao.insertAll([stock]);

      // Nuke the table
      await stockDao.nuke();

      // Fetch all stocks
      final stocks = await stockDao.fetchAllStocks();

      // Verify the results
      expect(stocks, isEmpty);
    });
  });
}
