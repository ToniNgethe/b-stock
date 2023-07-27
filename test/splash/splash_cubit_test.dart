import 'package:bloc_test/bloc_test.dart';
import 'package:bstock/core/company/domain/company_repository.dart';
import 'package:bstock/core/models/generic_cubit_state.dart';
import 'package:bstock/feature/splash/presentation/splash_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CompanyRepository>()])
void main() {
  group('SplashCubit Test', () {
    late MockCompanyRepository mockCompanyRepository;
    late SplashCubit splashCubit;

    setUp(() {
      mockCompanyRepository = MockCompanyRepository();
      splashCubit = SplashCubit(mockCompanyRepository);
    });

    tearDown(() {
      splashCubit.close();
    });

    blocTest(
      'emits [loading, success] when initApp succeeds',
      build: () {
        when(mockCompanyRepository.companiesAlreadyAdded())
            .thenAnswer((_) async => true);
        return splashCubit;
      },
      act: (cubit) => cubit.initApp(),
      expect: () => [
        const GenericCubitState.loading(),
        const GenericCubitState.success("Success")
      ],
    );

    blocTest<SplashCubit, GenericCubitState>(
      'emits [loading, error] when initApp fails',
      build: () {
        when(mockCompanyRepository.companiesAlreadyAdded())
            .thenThrow('Test Error');
        return splashCubit;
      },
      act: (cubit) => cubit.initApp(),
      expect: () => [
        const GenericCubitState.loading(),
        GenericCubitState.error('Test Error')
      ],
    );
  });
}
