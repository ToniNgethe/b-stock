import 'package:bloc_test/bloc_test.dart';
import 'package:bstock/core/company/domain/company_repository.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:bstock/feature/add_select_company/presentation/bloc/add_select_company_cubit.dart';
import 'package:bstock/feature/add_select_company/presentation/bloc/add_select_company_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_select_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CompanyRepository>()])
void main() {
  group('AddSelectCompanyCubit Test', () {
    late MockCompanyRepository mockCompanyRepository;
    late AddSelectCompanyCubit addSelectCompanyCubit;

    setUp(() {
      mockCompanyRepository = MockCompanyRepository();
      addSelectCompanyCubit = AddSelectCompanyCubit(mockCompanyRepository);
    });

    tearDown(() {
      addSelectCompanyCubit.close();
    });

    blocTest(
      'emits [loading, companies] when fetchCompanies succeeds',
      build: () {
        when(mockCompanyRepository.fetchAndListenForCompanyUpdates())
            .thenAnswer(
          (_) => Stream.fromIterable([Company.getDefaultCompanies()]),
        );
        return addSelectCompanyCubit;
      },
      act: (cubit) => cubit.fetchCompanies(),
      expect: () => [
        const AddSelectCompanyState.loading(),
        AddSelectCompanyState.companies(Company.getDefaultCompanies())
      ],
    );

    blocTest(
      'emits [loading, error] when fetchCompanies fails',
      build: () {
        when(mockCompanyRepository.fetchAndListenForCompanyUpdates())
            .thenThrow('Test Error');
        return addSelectCompanyCubit;
      },
      act: (cubit) => cubit.fetchCompanies(),
      expect: () => [
        const AddSelectCompanyState.loading(),
        const AddSelectCompanyState.error('Test Error')
      ],
    );
  });
}
