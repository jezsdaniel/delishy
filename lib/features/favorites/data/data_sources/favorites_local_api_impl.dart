import 'package:delishy/features/favorites/data/data_sources/favorites_local_api.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesLocalStorageImpl extends FavoritesLocalStorage {
  @protected
  Database? favoritesDb;

  @protected
  final favoritesStreamController =
      BehaviorSubject<List<Meal>>.seeded(const []);

  @protected
  Future<Database> initDatabase() async {
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
    final favorites = await db.query('favorites').then((value) {
      return value.map(Meal.fromDbMap).toList();
    });
    favoritesStreamController.add(favorites);
    return db;
  }

  Future<Database> get database async {
    favoritesDb ??= await initDatabase();
    return favoritesDb!;
  }

  @override
  Future<int> addFavorite(Meal meal) async {
    final db = await database;
    final r = db.insert(
      'favorites',
      meal.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    favoritesStreamController.add([...favoritesStreamController.value, meal]);
    return r;
  }

  @override
  Future<int> removeFavorite(Meal meal) async {
    final db = await database;
    final r = db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [meal.id],
    );
    favoritesStreamController.add(
      favoritesStreamController.value
          .where((element) => element.id != meal.id)
          .toList(),
    );
    return r;
  }

  @override
  Stream<List<Meal>> getAllFavorites() {
    return favoritesStreamController.asBroadcastStream();
  }
}
