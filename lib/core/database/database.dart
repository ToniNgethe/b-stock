import 'package:bstock/core/database/dao/stock_dao.dart';
import 'package:floor/floor.dart';


import 'dart:async';


import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/company_dao.dart';
import 'models/company.dart';
import 'models/stock_entity.dart';

part 'database.g.dart';


@Database(version: 1, entities: [Company, StockEntity])
abstract class AppDatabase extends FloorDatabase {
  CompanyDao get companyDao;
  StockDao get stockDao;
}
