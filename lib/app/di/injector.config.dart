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
import '../../core/company/presentation/company_cubit.dart' as _i13;
import '../../core/database/dao/company_dao.dart' as _i4;
import '../../core/database/dao/stock_dao.dart' as _i10;
import '../../core/database/database.dart' as _i3;
import '../../core/database/database_module.dart' as _i17;
import '../../core/internet_status/presentation/bloc/internet_status_cubit.dart'
    as _i8;
import '../../core/network/api_provider.dart' as _i12;
import '../../core/network/dio_client.dart' as _i18;
import '../../feature/add_select_company/presentation/bloc/add_select_company_cubit.dart'
    as _i11;
import '../../feature/splash/presentation/splash_cubit.dart' as _i9;
import '../../feature/stocks/data/stocks_repository_impl.dart' as _i15;
import '../../feature/stocks/domain/stocks_repository.dart' as _i14;
import '../../feature/stocks/presentation/bloc/stock_cubit.dart' as _i16;

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
  gh.singleton<_i4.CompanyDao>(
      databaseNodule.getCompanyDao(gh<_i3.AppDatabase>()));
  gh.factory<_i5.CompanyRepository>(
      () => _i6.CompanyRepoImpl(gh<_i4.CompanyDao>()));
  gh.lazySingleton<_i7.Dio>(() => dioClient.dio);
  gh.factory<_i8.InternetStatusCubit>(() => _i8.InternetStatusCubit());
  gh.factory<_i9.SplashCubit>(
      () => _i9.SplashCubit(gh<_i5.CompanyRepository>()));
  gh.singleton<_i10.StockDao>(
      databaseNodule.getStockDao(gh<_i3.AppDatabase>()));
  gh.factory<_i11.AddSelectCompanyCubit>(
      () => _i11.AddSelectCompanyCubit(gh<_i5.CompanyRepository>()));
  gh.singleton<_i12.ApiProvider>(_i12.ApiProvider(gh<_i7.Dio>()));
  gh.factory<_i13.CompanyCubit>(
      () => _i13.CompanyCubit(gh<_i5.CompanyRepository>()));
  gh.factory<_i14.StocksRepository>(() => _i15.StocksRepositoryImpl(
        gh<_i4.CompanyDao>(),
        gh<_i10.StockDao>(),
        gh<_i12.ApiProvider>(),
      ));
  gh.factory<_i16.StockCubit>(
      () => _i16.StockCubit(gh<_i14.StocksRepository>()));
  return getIt;
}

class _$DatabaseNodule extends _i17.DatabaseNodule {}

class _$DioClient extends _i18.DioClient {}
