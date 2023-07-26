import 'package:bstock/core/database/models/company.dart';
import 'package:floor/floor.dart';

@dao
abstract class CompanyDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(Company company);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<Company> companies);

  @Query("SELECT * FROM company")
  Stream<List<Company>> fetchAndStreamAllCompanies();

  @Query("SELECT * FROM company")
  Future<List<Company>> fetchAllCompanies();
}
