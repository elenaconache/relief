import 'package:get_it/get_it.dart';
import 'package:relief/blocs/login/login_cubit.dart';
import 'package:relief/blocs/splash/splash_cubit.dart';
import 'package:relief/data/repository/database_repository.dart';
import 'package:relief/data/repository/translations_repository.dart';
import 'package:relief/navigation/relief_router_delegate.dart';

final getIt = GetIt.instance;

void inject() {
  getIt.registerLazySingleton<TranslationsRepository>(
      () => TranslationsRepository());
  getIt.registerFactory<SplashCubit>(() => SplashCubit(
        translationsRepository: getIt.get<TranslationsRepository>(),
        databaseRepository: getIt.get<DatabaseRepository>(),
      ));
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
  getIt.registerLazySingleton<DatabaseRepository>(() => DatabaseRepository());
  getIt.registerLazySingleton<ReliefRouterDelegate>(
      () => ReliefRouterDelegate());
}