// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CompanyDao? _companyDaoInstance;

  StockDao? _stockDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Company` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `symbol` TEXT NOT NULL, `selected` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `StockEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `open` REAL, `close` REAL, `high` REAL, `low` REAL, `date` TEXT, `symbol` TEXT, `company` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CompanyDao get companyDao {
    return _companyDaoInstance ??= _$CompanyDao(database, changeListener);
  }

  @override
  StockDao get stockDao {
    return _stockDaoInstance ??= _$StockDao(database, changeListener);
  }
}

class _$CompanyDao extends CompanyDao {
  _$CompanyDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _companyInsertionAdapter = InsertionAdapter(
            database,
            'Company',
            (Company item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'symbol': item.symbol,
                  'selected': item.selected ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Company> _companyInsertionAdapter;

  @override
  Stream<List<Company>> fetchAndStreamAllCompanies() {
    return _queryAdapter.queryListStream('SELECT * FROM company',
        mapper: (Map<String, Object?> row) => Company(
            id: row['id'] as int?,
            name: row['name'] as String,
            symbol: row['symbol'] as String,
            selected: (row['selected'] as int) != 0),
        queryableName: 'company',
        isView: false);
  }

  @override
  Future<List<Company>> fetchAllCompanies() async {
    return _queryAdapter.queryList('SELECT * FROM company',
        mapper: (Map<String, Object?> row) => Company(
            id: row['id'] as int?,
            name: row['name'] as String,
            symbol: row['symbol'] as String,
            selected: (row['selected'] as int) != 0));
  }

  @override
  Future<void> insert(Company company) async {
    await _companyInsertionAdapter.insert(company, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertAll(List<Company> companies) async {
    await _companyInsertionAdapter.insertList(
        companies, OnConflictStrategy.replace);
  }
}

class _$StockDao extends StockDao {
  _$StockDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _stockEntityInsertionAdapter = InsertionAdapter(
            database,
            'StockEntity',
            (StockEntity item) => <String, Object?>{
                  'id': item.id,
                  'open': item.open,
                  'close': item.close,
                  'high': item.high,
                  'low': item.low,
                  'date': item.date,
                  'symbol': item.symbol,
                  'company': item.company
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StockEntity> _stockEntityInsertionAdapter;

  @override
  Stream<List<StockEntity>> fetchAndStreamAllCompanies() {
    return _queryAdapter.queryListStream('SELECT * FROM stock',
        mapper: (Map<String, Object?> row) => StockEntity(
            date: row['date'] as String?,
            symbol: row['symbol'] as String?,
            company: row['company'] as String?,
            id: row['id'] as int?,
            open: row['open'] as double?,
            close: row['close'] as double?,
            high: row['high'] as double?,
            low: row['low'] as double?),
        queryableName: 'stock',
        isView: false);
  }

  @override
  Future<void> insertAll(List<StockEntity> stocks) async {
    await _stockEntityInsertionAdapter.insertList(
        stocks, OnConflictStrategy.replace);
  }
}
