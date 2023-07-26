import 'package:floor/floor.dart';

@Entity()
class Company {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String symbol;
  final bool selected;

  Company(this.id, this.name, this.symbol, this.selected);
}
