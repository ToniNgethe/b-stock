// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/company/data/company_repo_impl.dart' as _i6;
import '../../core/company/domain/company_repository.dart' as _i5;
import '../../core/database/dao/company_dao.dart' as _i4;
import '../../core/database/database.dart' as _i3;
import '../../core/database/database_module.dart' as _i11;
import '../../core/network/api_provider.dart' as _i10;
import '../../core/network/dio_client.dart' as _i12;
import '../../feature/add_select_company/presentation/bloc/add_select_company_cubit.dart'
    as _i9;
import '../../feature/splash/presentation/splash_cubit.dart' as _i8;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final databaseNodule = _$DatabaseNodule();
  final dioClient = _$DioClient();
  await gh.lazySingletonAsync<_i3.AppDatabase>(
    () => databaseNodule.database,
    preResolve: true,
  );
  gh.factory<_i4.CompanyDao>(
      () => databaseNodule.getCompanyDao(gh<_i3.AppDatabase>()));
  gh.factory<_i5.CompanyRepository>(
      () => _i6.CompanyRepoImpl(gh<_i4.CompanyDao>()));
  gh.lazySingleton<_i7.Dio>(() => dioClient.dio);
  gh.factory<_i8.SplashCubit>(
      () => _i8.SplashCubit(gh<_i5.CompanyRepository>()));
  gh.factory<_i9.AddSelectCompanyCubit>(
      () => _i9.AddSelectCompanyCubit(gh<_i5.CompanyRepository>()));
  gh.singleton<_i10.ApiProvider>(_i10.ApiProvider(gh<_i7.Dio>()));
  return getIt;
}

class _$DatabaseNodule extends _i11.DatabaseNodule {}

class _$DioClient extends _i12.DioClient {}
