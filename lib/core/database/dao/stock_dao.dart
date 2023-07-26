import 'package:floor/floor.dart';

import '../models/stock_entity.dart';

@dao
abstract class StockDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<StockEntity> stocks);

  @Query("SELECT * FROM stock")
  Stream<List<StockEntity>> fetchAndStreamAllCompanies();
}
