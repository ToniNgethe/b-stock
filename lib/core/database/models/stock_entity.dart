import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'stock')
class StockEntity extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final double? open;
  final double? close;
  final double? high;
  final double? low;
  final String? date;
  final String? symbol;
  final String? company;

  StockEntity(
      {this.date,
      this.symbol,
      this.company,
      this.id,
      this.open,
      this.close,
      this.high,
      this.low});

  @override
  List<Object?> get props => [id, open, close, symbol, company];
}
