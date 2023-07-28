

import 'dart:io';

import 'package:bstock/core/database/dao/company_dao.dart';
import 'package:bstock/core/database/dao/stock_dao.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:bstock/core/network/api_provider.dart';
import 'package:bstock/feature/stocks/data/dto/stock_response_dto.dart';
import 'package:bstock/feature/stocks/data/stocks_repository_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'stocks_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CompanyDao>(), MockSpec<StockDao>(), MockSpec<ApiProvider>()])
void main() {
  late MockCompanyDao mockCompanyDao;
  late MockStockDao mockStockDao;
  late MockApiProvider mockApiProvider;
  late StocksRepositoryImpl stocksRepositoryImpl;

  setUp(() {
    // Loading from a file synchronously.
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());

    mockCompanyDao = MockCompanyDao();
    mockStockDao = MockStockDao();
    mockApiProvider = MockApiProvider();
    stocksRepositoryImpl = StocksRepositoryImpl(mockCompanyDao, mockStockDao, mockApiProvider);
  });

  group('fetchStockEntity', () {
    test('fetches stock entity successfully', () async {
      final companies = Company.getDefaultCompanies();
      final stockResponseDto = StockResponseDto(data: [StockData(symbol: 'TC', date: '2023-07-28', open: 100, close: 110, high: 115, low: 90)]);

      when(mockCompanyDao.fetchAllCompanies()).thenAnswer((_) async => companies);
      when(mockApiProvider.get(any, any)).thenAnswer((_) async => stockResponseDto.toJson());

      await stocksRepositoryImpl.fetchStockEntity();

      verify(mockCompanyDao.fetchAllCompanies()).called(1);
      verify(mockApiProvider.get(any, any)).called(1);
      verify(mockStockDao.insertAll(any)).called(1);
    });
  });

  group('fetchCompanies', () {
    test('fetches companies successfully', () async {
      final companies = Company.getDefaultCompanies();

      when(mockCompanyDao.fetchAllCompanies()).thenAnswer((_) async => companies);

      final result = await stocksRepositoryImpl.fetchCompanies();

      verify(mockCompanyDao.fetchAllCompanies()).called(1);
      expect(result, companies);
    });
  });
}