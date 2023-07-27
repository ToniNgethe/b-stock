import '../../database/models/company.dart';

abstract class CompanyRepository {
  Future<bool> companiesAlreadyAdded();
  Stream<List<Company>> fetchAndListenForCompanyUpdates();
  Future<List<Company>> fetchCompanies();
}