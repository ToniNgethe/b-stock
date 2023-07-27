import 'package:bloc_test/bloc_test.dart';
import 'package:bstock/core/database/models/stock_entity.dart';
import 'package:bstock/feature/stocks/domain/stocks_repository.dart';
import 'package:bstock/feature/stocks/presentation/bloc/stock_cubit.dart';
import 'package:bstock/feature/stocks/presentation/bloc/stock_state.dart';
import 'package:bstock/feature/stocks/presentation/stock_ui.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'stock_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<StocksRepository>()])
void main() {
  group('StockCubit Test', () {
    late MockStocksRepository mockStocksRepository;
    late StockCubit stockCubit;

    setUp(() {
      mockStocksRepository = MockStocksRepository();
      stockCubit = StockCubit(mockStocksRepository);
    });

    tearDown(() {
      stockCubit.close();
    });

    blocTest(
      'emits [loading, stockData] when fetchData succeeds',
      build: () {
        when(mockStocksRepository.fetchStockEntity(any, any))
            .thenAnswer((_) async {});
        return stockCubit;
      },
      act: (cubit) => cubit.fetchData(),
      expect: () => [
        const StockState.loading(),
      ],
    );

    blocTest(
      'emits [loading, error] when fetchData fails',
      build: () {
        when(mockStocksRepository.fetchStockEntity(any, any))
            .thenThrow(('Test Error'));
        return stockCubit;
      },
      act: (cubit) => cubit.fetchData(),
      expect: () =>
          [const StockState.loading(), const StockState.error('Test Error')],
    );

    // listenForStockDataUpdates
    blocTest(
      'emits [stockData] when listenForStockDataUpdates is called with gaining stock',
      build: () {
        when(mockStocksRepository.fetchAndListenForStock()).thenAnswer(
          (_) => Stream.fromIterable([
            [
              StockEntity(
                  id: 1,
                  open: 100.1,
                  close: 150.6,
                  high: 200.3,
                  low: 50.2,
                  date: '2023-07-27',
                  symbol: 'TST',
                  company: 'Test Company 1')
            ]
          ]),
        );
        return stockCubit;
      },
      act: (cubit) => cubit.listenForStockDataUpdates(),
      wait: const Duration(seconds: 1),
      expect: () => [
        StockState.stockData(StockUi(
            highestStock: StockEntity(
                id: 1,
                open: 100.1,
                close: 150.6,
                high: 200.3,
                low: 50.2,
                date: '2023-07-27',
                symbol: 'TST',
                company: 'Test Company 1'),
            lowestStock: null,
            stocks: [
              StockEntity(
                  id: 1,
                  open: 100.1,
                  close: 150.6,
                  high: 200.3,
                  low: 50.2,
                  date: '2023-07-27',
                  symbol: 'TST',
                  company: 'Test Company 1')
            ]))
      ],
    );

    // listenForStockDataUpdates
    blocTest(
      'emits [stockData] when listenForStockDataUpdates is called with losing stock',
      build: () {
        when(mockStocksRepository.fetchAndListenForStock()).thenAnswer(
          (_) => Stream.fromIterable([
            [
              StockEntity(
                  id: 1,
                  open: 200.1,
                  close: 150.6,
                  high: 200.3,
                  low: 50.2,
                  date: '2023-07-27',
                  symbol: 'TST',
                  company: 'Test Company 1')
            ]
          ]),
        );
        return stockCubit;
      },
      act: (cubit) => cubit.listenForStockDataUpdates(),
      wait: const Duration(seconds: 1),
      expect: () => [
        StockState.stockData(StockUi(
            lowestStock: StockEntity(
                id: 1,
                open: 200.1,
                close: 150.6,
                high: 200.3,
                low: 50.2,
                date: '2023-07-27',
                symbol: 'TST',
                company: 'Test Company 1'),
            highestStock: null,
            stocks: [
              StockEntity(
                  id: 1,
                  open: 200.1,
                  close: 150.6,
                  high: 200.3,
                  low: 50.2,
                  date: '2023-07-27',
                  symbol: 'TST',
                  company: 'Test Company 1')
            ]))
      ],
    );

    final sampleStock = StockEntity(
        id: 1,
        open: 100.1,
        close: 150.6,
        high: 200.3,
        low: 50.2,
        date: '2023-07-27',
        symbol: 'TST',
        company: 'Test Company 1');

    // searchItems
    blocTest(
      'emits [stockData] when searchItems is called with a valid query',
      build: () {
        when(mockStocksRepository.fetchAndListenForStock()).thenAnswer(
          (_) => Stream.fromIterable([
            [sampleStock]
          ]),
        );
        return stockCubit;
      },
      wait: const Duration(seconds: 4),
      act: (cubit) async {
        cubit.listenForStockDataUpdates();
        await Future.delayed(const Duration(seconds: 1));
        return cubit.searchItems('Test');
      },
      expect: () => [
        StockState.stockData(StockUi(
            highestStock: sampleStock,
            lowestStock: null,
            stocks: [sampleStock]))
      ],
    );


    // fetchAndFilterByDate
    blocTest(
      'emits [stockData, loading] when fetchAndFilterByDate is called',
      build: () {
        when(mockStocksRepository.fetchStockEntity(any, any)).thenAnswer((_) async {});
        when(mockStocksRepository.fetchAndListenForStock()).thenAnswer(
              (_) => Stream.fromIterable([
            [sampleStock]
          ]),
        );
        return stockCubit;
      },
      act: (cubit) async{
        cubit.listenForStockDataUpdates();
        await Future.delayed(const Duration(seconds: 1));
        cubit.fetchAndFilterByDate(DateTime.now(), DateTime.now().subtract(Duration(days: 1)));
      },
      wait: const Duration(seconds: 1),
      expect: () => [
        StockState.stockData(StockUi(
            highestStock: sampleStock,
            lowestStock: null,
            stocks: [sampleStock],
            fromDate: DateFormat("d MMM, yyyy").format(DateTime.now().subtract(Duration(days: 1))),
            toDate: DateFormat("d MMM, yyyy").format(DateTime.now())
        )),
        const StockState.loading(),
      ],
    );
  });
}
