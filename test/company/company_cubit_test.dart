import 'package:bloc_test/bloc_test.dart';
import 'package:bstock/core/company/domain/company_repository.dart';
import 'package:bstock/core/company/presentation/company_cubit.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'company_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CompanyRepository>()])
void main() {
  group('CompanyCubit', () {
    late MockCompanyRepository repository;
    late CompanyCubit cubit;

    setUp(() {
      repository = MockCompanyRepository();
      cubit = CompanyCubit(repository);
    });

    tearDown(() {
      cubit.close();
    });

    blocTest<CompanyCubit, List<Company>>(
      'emits companies when fetchCompanies succeeds',
      build: () {
        when(repository.fetchCompanies())
            .thenAnswer((_) async => Company.getDefaultCompanies());
        return cubit;
      },
      act: (c) => c.fetchCompanies(),
      expect: () => [Company.getDefaultCompanies()],
    );
  });
}
