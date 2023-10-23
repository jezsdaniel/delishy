import 'package:delishy/core/network/connectivity.dart';
import 'package:delishy/core/network/connectivity_mock.dart';
import 'package:delishy/core/network/http_client_mock.dart';
import 'package:delishy/features/recipes/data/data_sources/recipes_remote_api.dart';
import 'package:delishy/features/recipes/data/data_sources/recipes_remote_api_mock.dart';
import 'package:delishy/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:delishy/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:delishy/features/recipes/domain/use_cases/get_random_meal.dart';
import 'package:delishy/features/recipes/presentation/manager/daily_recipe/daily_recipe_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class Injector {
  Injector._init() {
    getIt = GetIt.instance;
    _registerCommonImpl();
    _registerApiLayer();
    _registerBlocs();
    _registerUserCaseLayer();
    _registerRepositoryLayer();
  }

  Injector._initTests() {
    getIt = GetIt.instance;
    _registerCommonImplTest();
    _registerApiLayerTest();
    _registerBlocsTest();
    _registerUserCaseLayerTest();
    _registerRepositoryLayerTest();
  }

  static GetIt? getIt;

  static void init() => getIt == null ? Injector._init() : null;

  static void initTests() => getIt == null ? Injector._initTests() : null;

  void _registerCommonImpl() {
    getIt!
      ..registerSingleton<http.Client>(http.Client())
      ..registerSingleton<ConnectivityService>(ConnectivityService());
  }

  void _registerApiLayer() {
    getIt!.registerLazySingleton<RecipesRemoteApi>(
      () => RecipesRemoteApiImpl(httpClient: getIt!.get()),
    );
  }

  void _registerBlocs() {
    getIt!.registerFactory<DailyRecipeBloc>(
      () => DailyRecipeBloc(
        getIt!.get(),
      ),
    );
  }

  void _registerUserCaseLayer() {
    getIt!.registerLazySingleton<GetRandomMealUseCase>(
      () => GetRandomMealUseCase(getIt!.get()),
    );
  }

  void _registerRepositoryLayer() {
    getIt!.registerLazySingleton<RecipesRepository>(
      () => RecipesRepositoryImpl(getIt!.get(), getIt!.get()),
    );
  }

  void _registerCommonImplTest() {
    getIt!
      ..registerSingleton<http.Client>(MockHttpClient())
      ..registerSingleton<ConnectivityService>(MockConnectivityService());
  }

  void _registerApiLayerTest() {
    getIt!.registerLazySingleton<RecipesRemoteApi>(
      MockRecipesRemoteApi.new,
    );
  }

  void _registerBlocsTest() {
    getIt!.registerFactory<DailyRecipeBloc>(
      () => DailyRecipeBloc(
        getIt!.get(),
      ),
    );
  }

  void _registerUserCaseLayerTest() {
    getIt!.registerLazySingleton<GetRandomMealUseCase>(
        () => GetRandomMealUseCase(getIt!.get()));
  }

  void _registerRepositoryLayerTest() {
    getIt!.registerLazySingleton<RecipesRepository>(
      () => RecipesRepositoryImpl(getIt!.get(), getIt!.get()),
    );
  }
}
