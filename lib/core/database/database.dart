import 'package:floor/floor.dart';


import 'dart:async';


import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/company_dao.dart';
import 'models/company.dart';

part 'database.g.dart';


@Database(version: 1, entities: [Company])
abstract class AppDatabase extends FloorDatabase {
  CompanyDao get companyDao;
}
