import 'dart:convert';

StockResponseDto stockResponseDtoFromJson(String str) =>
    StockResponseDto.fromJson(json.decode(str));

String stockResponseDtoToJson(StockResponseDto data) =>
    json.encode(data.toJson());

class StockResponseDto {
  StockResponseDto({
    Pagination? pagination,
    List<StockData>? data,
  }) {
    _pagination = pagination;
    _data = data;
  }

  StockResponseDto.fromJson(dynamic json) {
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(StockData.fromJson(v));
      });
    }
  }

  Pagination? _pagination;
  List<StockData>? _data;

  StockResponseDto copyWith({
    Pagination? pagination,
    List<StockData>? data,
  }) =>
      StockResponseDto(
        pagination: pagination ?? _pagination,
        data: data ?? _data,
      );

  Pagination? get pagination => _pagination;

  List<StockData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

StockData dataFromJson(String str) => StockData.fromJson(json.decode(str));

String dataToJson(StockData data) => json.encode(data.toJson());

class StockData {
  StockData({
    num? open,
    num? high,
    num? low,
    num? close,
    num? volume,
    num? adjHigh,
    num? adjLow,
    num? adjClose,
    num? adjOpen,
    num? adjVolume,
    num? splitFactor,
    num? dividend,
    String? symbol,
    String? exchange,
    String? date,
  }) {
    _open = open;
    _high = high;
    _low = low;
    _close = close;
    _volume = volume;
    _adjHigh = adjHigh;
    _adjLow = adjLow;
    _adjClose = adjClose;
    _adjOpen = adjOpen;
    _adjVolume = adjVolume;
    _splitFactor = splitFactor;
    _dividend = dividend;
    _symbol = symbol;
    _exchange = exchange;
    _date = date;
  }

  StockData.fromJson(dynamic json) {
    _open = json['open'];
    _high = json['high'];
    _low = json['low'];
    _close = json['close'];
    _volume = json['volume'];
    _adjHigh = json['adj_high'];
    _adjLow = json['adj_low'];
    _adjClose = json['adj_close'];
    _adjOpen = json['adj_open'];
    _adjVolume = json['adj_volume'];
    _splitFactor = json['split_factor'];
    _dividend = json['dividend'];
    _symbol = json['symbol'];
    _exchange = json['exchange'];
    _date = json['date'];
  }

  num? _open;
  num? _high;
  num? _low;
  num? _close;
  num? _volume;
  num? _adjHigh;
  num? _adjLow;
  num? _adjClose;
  num? _adjOpen;
  num? _adjVolume;
  num? _splitFactor;
  num? _dividend;
  String? _symbol;
  String? _exchange;
  String? _date;

  StockData copyWith({
    num? open,
    num? high,
    num? low,
    num? close,
    num? volume,
    num? adjHigh,
    num? adjLow,
    num? adjClose,
    num? adjOpen,
    num? adjVolume,
    num? splitFactor,
    num? dividend,
    String? symbol,
    String? exchange,
    String? date,
  }) =>
      StockData(
        open: open ?? _open,
        high: high ?? _high,
        low: low ?? _low,
        close: close ?? _close,
        volume: volume ?? _volume,
        adjHigh: adjHigh ?? _adjHigh,
        adjLow: adjLow ?? _adjLow,
        adjClose: adjClose ?? _adjClose,
        adjOpen: adjOpen ?? _adjOpen,
        adjVolume: adjVolume ?? _adjVolume,
        splitFactor: splitFactor ?? _splitFactor,
        dividend: dividend ?? _dividend,
        symbol: symbol ?? _symbol,
        exchange: exchange ?? _exchange,
        date: date ?? _date,
      );

  num? get open => _open;

  num? get high => _high;

  num? get low => _low;

  num? get close => _close;

  num? get volume => _volume;

  num? get adjHigh => _adjHigh;

  num? get adjLow => _adjLow;

  num? get adjClose => _adjClose;

  num? get adjOpen => _adjOpen;

  num? get adjVolume => _adjVolume;

  num? get splitFactor => _splitFactor;

  num? get dividend => _dividend;

  String? get symbol => _symbol;

  String? get exchange => _exchange;

  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open'] = _open;
    map['high'] = _high;
    map['low'] = _low;
    map['close'] = _close;
    map['volume'] = _volume;
    map['adj_high'] = _adjHigh;
    map['adj_low'] = _adjLow;
    map['adj_close'] = _adjClose;
    map['adj_open'] = _adjOpen;
    map['adj_volume'] = _adjVolume;
    map['split_factor'] = _splitFactor;
    map['dividend'] = _dividend;
    map['symbol'] = _symbol;
    map['exchange'] = _exchange;
    map['date'] = _date;
    return map;
  }
}

Pagination paginationFromJson(String str) =>
    Pagination.fromJson(json.decode(str));

String paginationToJson(Pagination data) => json.encode(data.toJson());

class Pagination {
  Pagination({
    num? limit,
    num? offset,
    num? count,
    num? total,
  }) {
    _limit = limit;
    _offset = offset;
    _count = count;
    _total = total;
  }

  Pagination.fromJson(dynamic json) {
    _limit = json['limit'];
    _offset = json['offset'];
    _count = json['count'];
    _total = json['total'];
  }

  num? _limit;
  num? _offset;
  num? _count;
  num? _total;

  Pagination copyWith({
    num? limit,
    num? offset,
    num? count,
    num? total,
  }) =>
      Pagination(
        limit: limit ?? _limit,
        offset: offset ?? _offset,
        count: count ?? _count,
        total: total ?? _total,
      );

  num? get limit => _limit;

  num? get offset => _offset;

  num? get count => _count;

  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['limit'] = _limit;
    map['offset'] = _offset;
    map['count'] = _count;
    map['total'] = _total;
    return map;
  }
}
