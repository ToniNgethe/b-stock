import 'package:bstock/core/company/data/company_repo_impl.dart';
import 'package:bstock/core/database/dao/company_dao.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'company_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CompanyDao>()])
void main() {
  group('CompanyRepoImpl Test', () {
    late CompanyRepoImpl companyRepo;
    late MockCompanyDao mockCompanyDao;

    setUp(() {
      mockCompanyDao = MockCompanyDao();
      companyRepo = CompanyRepoImpl(mockCompanyDao);
    });

    test('test companiesAlreadyAdded when companies present', () async {
      // Mock the fetchAllCompanies method
      final companies = Company.getDefaultCompanies();
      when(mockCompanyDao.fetchAllCompanies()).thenAnswer((_) async => companies);

      // Call companiesAlreadyAdded
      final result = await companyRepo.companiesAlreadyAdded();

      // Verify the results
      expect(result, true);
    });

    test('test companiesAlreadyAdded when companies not present', () async {
      // Mock the fetchAllCompanies method
      when(mockCompanyDao.fetchAllCompanies()).thenAnswer((_) async => []);

      // Mock the insertAll method
      when(mockCompanyDao.insertAll(any)).thenAnswer((_) async => {});

      // Call companiesAlreadyAdded
      final result = await companyRepo.companiesAlreadyAdded();

      // Verify the results
      expect(result, false);
      verify(mockCompanyDao.insertAll(any)).called(1);
    });

    test('test fetchAndListenForCompanyUpdates', () async {
      // Mock the fetchAndStreamAllCompanies method
      final companies = Stream<List<Company>>.fromIterable([[Company.getDefaultCompanies()[0]]]);
      when(mockCompanyDao.fetchAndStreamAllCompanies()).thenAnswer((_) => companies);

      // Call fetchAndListenForCompanyUpdates
      final result = companyRepo.fetchAndListenForCompanyUpdates();

      // Verify the results
      expect(result, isNotNull);
      expect(result, isA<Stream<List<Company>>>());
    });

    test('test fetchCompanies', () async {
      // Mock the fetchAllCompanies method
      final companies = Company.getDefaultCompanies();
      when(mockCompanyDao.fetchAllCompanies()).thenAnswer((_) async => companies);

      // Call fetchCompanies
      final result = await companyRepo.fetchCompanies();

      // Verify the results
      expect(result, isNotEmpty);
      expect(result.first, companies.first);
    });

  });
}