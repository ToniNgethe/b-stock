import 'package:bstock/core/database/dao/company_dao.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:injectable/injectable.dart';

import '../domain/company_repository.dart';

@Injectable(as: CompanyRepository)
class CompanyRepoImpl implements CompanyRepository {
  final CompanyDao companyDao;

  CompanyRepoImpl(this.companyDao);

  @override
  Future<bool> companiesAlreadyAdded() async {
    try {
      final companiesAdded = await companyDao.fetchAllCompanies();
      if (companiesAdded.isEmpty) {
        // add default companies
        await _addDefaultCompanies();
      }

      return companiesAdded.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }

  Future _addDefaultCompanies() async {
    await companyDao.insertAll(Company.getDefaultCompanies());
  }

  @override
  Stream<List<Company>> fetchAndListenForCompanyUpdates() =>
      companyDao.fetchAndStreamAllCompanies();

  //TODO: capture error
  @override
  Future<List<Company>> fetchCompanies() async =>
      await companyDao.fetchAllCompanies();
}
