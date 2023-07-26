import 'package:bstock/core/database/dao/company_dao.dart';
import 'package:injectable/injectable.dart';

import 'database.dart';

@module
abstract class DatabaseNodule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> get database async =>
      await $FloorAppDatabase.databaseBuilder("b-stock").build();

  @injectable
  CompanyDao getCompanyDao(AppDatabase appDatabase) {
    return appDatabase.companyDao;
  }
}
