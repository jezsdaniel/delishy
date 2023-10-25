import 'package:delishy/features/favorites/data/data_sources/favorites_local_api.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesLocalStorageImpl extends FavoritesLocalStorage {
  Database? _db;

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE favorites (id TEXT PRIMARY KEY, name TEXT, category TEXT, area TEXT, instructions TEXT, thumb TEXT, tags TEXT, ingredients TEXT, measures TEXT)');
      },
    );
    return db;
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
