import 'package:delishy/features/recipes/data/data_sources/recipes_remote_api.dart';
import 'package:delishy/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:delishy/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:delishy/features/recipes/domain/use_cases/get_random_meal.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class Injector {
  Injector._init() {
    _registerCommonImpl();
    _registerApiLayer();
    _registerBlocs();
    _registerUserCaseLayer();
    _registerRepositoryLayer();
  }

  static final Injector _instance = Injector._init();

  static Injector get instance => _instance;

  final getIt = GetIt.instance;

  void _registerCommonImpl() {
    getIt.registerSingleton<http.Client>(http.Client());
  }

  void _registerApiLayer() {
    getIt.registerLazySingleton<RecipesRemoteApi>(
      () => RecipesRemoteApiImpl(httpClient: getIt.get()),
    );
  }

  void _registerBlocs() {}

  void _registerUserCaseLayer() {
    getIt.registerLazySingleton<GetRandomMealUseCase>(
      () => GetRandomMealUseCase(getIt.get()),
    );
  }

  void _registerRepositoryLayer() {
    getIt.registerLazySingleton<RecipesRepository>(
      () => RecipesRepositoryImpl(getIt.get(), getIt.get()),
    );
  }
}
