import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:bstock/feature/stocks/presentation/stock_ui.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/stocks_repository.dart';
import 'stock_state.dart';

@injectable
class StockCubit extends Cubit<StockState> {
  final StocksRepository stocksRepository;
  StreamSubscription? _streamSubscription;
  StockUi? _stockUi;

  StockCubit(this.stocksRepository) : super(const StockState.init()) {
    listenForStockDataUpdates();
  }

  /// The function `fetchData` fetches stock data and updates the state accordingly.
  void fetchData([String? dateFrom, String? dateTo]) async {
    try {
      emit(const StockState.loading());
      await stocksRepository.fetchStockEntity(dateFrom, dateTo);
    } catch (e) {
      emit(StockState.error(e.toString()));
    }
  }

  /// The function listens for stock data updates, calculates the highest and lowest
  /// stocks based on percentage change, and emits a new stock state with the
  /// updated data.
  void listenForStockDataUpdates() {
    _streamSubscription?.cancel();
    _streamSubscription =
        stocksRepository.fetchAndListenForStock().listen((event) {
      if (event.isNotEmpty) {
        // get highest and lowest stocks
        StockEntity? highestStock;
        StockEntity? lowestStock;

        int highest = 0;
        int lowest = 0;

        for (var element in event) {
          final percentage = StockUi.getPercentageChange(element);
          if (percentage > highest) {
            highest = percentage;
            highestStock = element;
          }

          if (percentage < lowest) {
            lowest = percentage;
            lowestStock = element;
          }
        }

        // only update ui with new data and
        // emit new ui if its first time
        _stockUi = _stockUi == null
            ? StockUi(
                highestStock: highestStock,
                lowestStock: lowestStock,
                stocks: event)
            : _stockUi?.copyWith(
                highestStock: highestStock,
                lowestStock: lowestStock,
                stocks: event);
        emit(StockState.stockData(_stockUi!));
      }
    });
  }

  /// The function `searchItems` filters a list of stocks based on a query and
  /// updates the UI with the filtered results.
  ///
  /// Args:
  ///   query (String): The query parameter is a String that represents the search
  /// query entered by the user. It is used to filter the stock data based on the
  /// company name.
  ///
  /// Returns:
  ///   a `StockState.stockData` object.
  void searchItems(String? query) {
    if (query == null) {
      emit(StockState.stockData(_stockUi!));
      return;
    }

    if (query.trim().length > 2) {
      final filteredStock = _stockUi?.stocks!
          .where((element) =>
              element.company!.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(StockState.stockData(StockUi(
          highestStock: _stockUi!.highestStock,
          lowestStock: _stockUi!.lowestStock,
          stocks: filteredStock)));
    } else {
      emit(StockState.stockData(_stockUi!));
    }
  }

  void fetchAndFilterByDate(DateTime to, DateTime from) {
    // update ui with new dates
    _stockUi = _stockUi!.copyWith(
      toDate: DateFormat("d MMM, yyyy").format(to),
      fromDate: DateFormat("d MMM, yyyy").format(from),
    );

    emit(StockState.stockData(_stockUi!));

    // make request
    fetchData(DateFormat("yyyy-MM-dd").format(from),
        DateFormat("yyyy-MM-dd").format(to));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
