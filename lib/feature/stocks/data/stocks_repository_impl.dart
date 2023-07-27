import 'dart:developer';

import 'package:bstock/core/database/dao/company_dao.dart';
import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:bstock/core/network/end_points.dart';
import 'package:bstock/feature/stocks/data/dto/stock_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/dao/stock_dao.dart';
import '../../../core/network/api_provider.dart';
import '../domain/stocks_repository.dart';

@Injectable(as: StocksRepository)
class StocksRepositoryImpl implements StocksRepository {
  final CompanyDao companyDao;
  final StockDao stocksDao;
  final ApiProvider apiProvider;

  StocksRepositoryImpl(this.companyDao, this.stocksDao, this.apiProvider);

  @override
  Future<void> fetchStockEntity([String? dateFrom, String? dateTo]) async {
    try {
      // fetch all companies
      final companies = await companyDao.fetchAllCompanies();

      // fetch data from api
      final queryParams = {
        'access_key': '79a5d93a473946a3062b4597d12efdbc',
        'symbols':
            companies.map((element) => element.symbol).toList().join(','),
        'date_from': dateFrom,
        'date_to': dateTo
      };

      final response = await apiProvider.get(EndPoints.eod.url, queryParams);
      final responseObj = StockResponseDto.fromJson(response);

      if (responseObj.data?.isEmpty == true) {
        //clear previous data if data is empty
        await stocksDao.nuke();

        // throw specific error in case user searched using a date range
        if (dateTo != null && dateFrom != null) {
          throw 'No stock data found from $dateFrom to ${dateTo}';
        }
        throw 'No stock data found at the moment';
      }

      //clear previous data
      await stocksDao.nuke();

      // save data to db
      await stocksDao.insertAll(responseObj.data!
          .map((e) => StockEntity(
              company: companies
                  .where((element) => element.symbol == e.symbol)
                  .firstOrNull
                  ?.name,
              date: e.date,
              symbol: e.symbol,
              open: e.open?.toDouble(),
              close: e.close?.toDouble(),
              high: e.high?.toDouble(),
              low: e.low?.toDouble()))
          .toList());

      log("Stock fetched and saved successfully");
    } catch (e) {
      // only throw exception if data is not available
      final stocks = await stocksDao.fetchAllStocks();
      if (stocks.isEmpty) rethrow;
    }
  }

  @override
  Stream<List<StockEntity>> fetchAndListenForStock() =>
      stocksDao.fetchAndStreamAllStocks();
}
