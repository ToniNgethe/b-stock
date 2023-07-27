import 'package:bstock/core/database/models/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../stock_ui.dart';

part 'stock_state.freezed.dart';

@freezed
class StockState with _$StockState {
  const factory StockState.init() = StockStateInit;

  const factory StockState.loading() = StockStateLoading;

  const factory StockState.error(String msg) = StockStateError;

  const factory StockState.stockData(StockUi stockUi) = StockStateUiData;

  const factory StockState.companies(List<Company> companies) =
      StockStateCompanies;
}
