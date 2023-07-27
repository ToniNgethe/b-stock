import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity()
class Company extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String symbol;
  final bool selected;

  Company(
      {this.id,
      required this.name,
      required this.symbol,
      required this.selected});

  static List<Company> getDefaultCompanies() {
    return [
      Company(name: "Apple", symbol: "AAPL", selected: true),
      Company(name: "Microsoft", symbol: "MSFT", selected: true),
      Company(name: "Amazon", symbol: "AMZN", selected: true),
      Company(name: "Alphabet", symbol: "GOOGL", selected: true),
      Company(name: "Tesla", symbol: "TSL", selected: true),
      Company(name: "Meta Platforms", symbol: "META", selected: true),
      Company(name: "Visa Inc", symbol: "V", selected: true),
      Company(name: "Paypal", symbol: "PYPL", selected: true),
      Company(name: "Facebook Inc", symbol: "FB", selected: true),
      Company(name: "Intel Corp", symbol: "INTC", selected: true),
    ];
  }

  @override
  List<Object?> get props => [name, symbol, selected];
}
