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
import '../../core/database/dao/stock_dao.dart' as _i9;
import '../../core/database/database.dart' as _i3;
import '../../core/database/database_module.dart' as _i15;
import '../../core/network/api_provider.dart' as _i11;
import '../../core/network/dio_client.dart' as _i16;
import '../../feature/add_select_company/presentation/bloc/add_select_company_cubit.dart'
    as _i10;
import '../../feature/splash/presentation/splash_cubit.dart' as _i8;
import '../../feature/stocks/data/stocks_repository_impl.dart' as _i13;
import '../../feature/stocks/domain/stocks_repository.dart' as _i12;
import '../../feature/stocks/presentation/bloc/stock_cubit.dart' as _i14;

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
  gh.factory<_i8.SplashCubit>(
      () => _i8.SplashCubit(gh<_i5.CompanyRepository>()));
  gh.singleton<_i9.StockDao>(databaseNodule.getStockDao(gh<_i3.AppDatabase>()));
  gh.factory<_i10.AddSelectCompanyCubit>(
      () => _i10.AddSelectCompanyCubit(gh<_i5.CompanyRepository>()));
  gh.singleton<_i11.ApiProvider>(_i11.ApiProvider(gh<_i7.Dio>()));
  gh.factory<_i12.StocksRepository>(() => _i13.StocksRepositoryImpl(
        gh<_i4.CompanyDao>(),
        gh<_i9.StockDao>(),
        gh<_i11.ApiProvider>(),
      ));
  gh.factory<_i14.StockCubit>(
      () => _i14.StockCubit(gh<_i12.StocksRepository>()));
  return getIt;
}

class _$DatabaseNodule extends _i15.DatabaseNodule {}

class _$DioClient extends _i16.DioClient {}
