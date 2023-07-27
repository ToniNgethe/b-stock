import '../../../core/database/models/stock_entity.dart';

class StockUi {
  final List<StockEntity>? stocks;
  final StockEntity? highestStock;
  final StockEntity? lowestStock;

  StockUi({this.stocks, this.highestStock, this.lowestStock});

  static int getPercentageChange(StockEntity stockEntity) {
    return (((stockEntity.close! - stockEntity.open!) / 100) * 100).toInt();
  }
}
