import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:bstock/feature/stocks/presentation/stock_ui.dart';
import 'package:injectable/injectable.dart';

import '../../domain/stocks_repository.dart';
import 'stock_state.dart';

@injectable
class StockCubit extends Cubit<StockState> {
  final StocksRepository stocksRepository;
  StreamSubscription? _streamSubscription;

  StockCubit(this.stocksRepository) : super(const StockState.init()) {
    listenForStockDataUpdates();
  }

  /// The function `fetchData` fetches stock data and updates the state accordingly.
  void fetchData() async {
    try {
      emit(const StockState.loading());
      await stocksRepository.fetchStockEntity();
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

        emit(StockState.stockData(StockUi(
            highestStock: highestStock,
            lowestStock: lowestStock,
            stocks: event)));
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
