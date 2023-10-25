import 'package:delishy/features/favorites/data/data_sources/favorites_local_api_impl.dart';
import 'package:delishy/features/recipes/domain/entities/meal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FavoritesLocalStorageMock extends FavoritesLocalStorageImpl {
  @override
  Future<Database> initDatabase() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    favoritesDb = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await favoritesDb!.execute(
        'CREATE TABLE favorites (id TEXT PRIMARY KEY, name TEXT, category TEXT, area TEXT, instructions TEXT, thumb TEXT, tags TEXT, ingredients TEXT, measures TEXT)');
    final favorites = await favoritesDb!.query('favorites').then((value) {
      return value.map(Meal.fromDbMap).toList();
    });
    favoritesStreamController.add(favorites);
    return favoritesDb!;
  }
}
