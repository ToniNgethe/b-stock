import 'package:bstock/core/database/models/stock_entity.dart';

abstract class StocksRepository {
  Future<void> fetchStockEntity();
  Stream<List<StockEntity>> fetchAndListenForStock();
}