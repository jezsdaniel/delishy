import 'package:delishy/features/favorites/data/data_sources/favorites_local_api.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FavoritesLocalStorageMock extends FavoritesLocalStorage {
  Database? _db;

  Future<Database> _initDatabase() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    _db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await _db!.execute(
        'CREATE TABLE favorites (id TEXT PRIMARY KEY, name TEXT, category TEXT, area TEXT, instructions TEXT, thumb TEXT, tags TEXT, ingredients TEXT, measures TEXT)');
    return _db!;
  }

  Future<Database> get database async {
    _db ??= await _initDatabase();
    return _db!;
  }

  @override
  Future<int> addFavorite(Meal meal) async {
    final db = await database;
    return db.insert(
      'favorites',
      meal.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Meal>> getAllFavorites() async {
    final db = await database;
    return db.query('favorites').then((value) {
      return value.map(Meal.fromDbMap).toList();
    });
  }

  @override
  Future<int> removeFavorite(Meal meal) async {
    final db = await database;
    return db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [meal.id],
    );
  }
}
