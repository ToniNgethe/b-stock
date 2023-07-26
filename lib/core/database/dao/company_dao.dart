import 'package:bstock/core/database/models/company.dart';
import 'package:floor/floor.dart';

@dao
abstract class CompanyDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(Company company);

  @Query("SELECT * FROM company")
  Stream<List<Company>> fetchAllCompanies();
}
