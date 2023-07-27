import 'package:bstock/core/database/database.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:test/test.dart';

void main() {

  group("Company dao tests", () {
    late AppDatabase database;

    setUpAll(() async {
      database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    });

    tearDownAll(() async {
      database.close();
    });


    test('test insert', () async {
      // Initialize the database
      final companyDao = database.companyDao;

      // Insert a company
      final company = Company.getDefaultCompanies()[0];
      await companyDao.insert(company);

      // Fetch all companies
      final companies = await companyDao.fetchAllCompanies();

      // Verify the results
      expect(companies, isNotEmpty);
      expect(companies.first == company, true);
    });

    test('test insertAll', () async {
      final companyDao = database.companyDao;

      // Insert multiple companies
      final companies = Company.getDefaultCompanies();
      await companyDao.insertAll(companies);

      // Fetch all companies
      final fetchedCompanies = await companyDao.fetchAllCompanies();

      // Verify the results
      expect(fetchedCompanies, containsAll(companies));

    });

    test('test fetchAllCompanies', () async {
      // Initialize the database
      final companyDao = database.companyDao;

      // Insert a company
      final company = Company.getDefaultCompanies()[0];
      await companyDao.insert(company);

      // Fetch all companies
      final companies = await companyDao.fetchAllCompanies();

      // Verify the results
      expect(companies, contains(company));
    });

    test('test fetchAndStreamAllCompanies', () async {
      // Initialize the database
      final companyDao = database.companyDao;

      // Insert a company
      final company = Company.getDefaultCompanies()[0];
      await companyDao.insert(company);

      // Fetch and stream all companies
      final companiesStream = companyDao.fetchAndStreamAllCompanies();

      // Verify the results
      companiesStream.listen((companies) {
        expect(companies, contains(company));
      });
    });
  });
}
