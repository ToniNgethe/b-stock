import 'package:intl/intl.dart';

import '../../../core/database/models/stock_entity.dart';

class StockUi {
  final List<StockEntity>? stocks;
  final StockEntity? highestStock;
  final StockEntity? lowestStock;
  final String? toDate;
  final String? fromDate;

  StockUi({
    this.stocks,
    this.highestStock,
    this.lowestStock,
    this.toDate,
    this.fromDate,
  });

  StockUi copyWith({
    List<StockEntity>? stocks,
    StockEntity? highestStock,
    StockEntity? lowestStock,
    String? toDate,
    String? fromDate,
  }) =>
      StockUi(
        stocks: stocks ?? this.stocks,
        highestStock: highestStock ?? this.highestStock,
        lowestStock: lowestStock ?? this.lowestStock,
        toDate: toDate ?? this.toDate,
        fromDate: fromDate ?? this.fromDate,
      );

  static int getPercentageChange(StockEntity stockEntity) {
    return (((stockEntity.close! - stockEntity.open!) / 100) * 100).toInt();
  }

  static String formatDate(String date) {
    final inputDate = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(date);
    return DateFormat("d MMM, yyyy").format(inputDate);
  }
}
