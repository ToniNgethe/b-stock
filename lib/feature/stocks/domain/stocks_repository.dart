import 'package:bstock/core/database/models/stock_entity.dart';

abstract class StocksRepository {
  Future<void> fetchStockEntity([ String? dateFrom, String? dateTo]);
  Stream<List<StockEntity>> fetchAndListenForStock();
}