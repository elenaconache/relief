import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:relief/blocs/login/login_cubit.dart';
import 'package:relief/blocs/splash/splash_cubit.dart';
import 'package:relief/data/repository/database_repository.dart';
import 'package:relief/data/repository/shared_preferences_repository.dart';
import 'package:relief/data/repository/social_signin_repository.dart';
import 'package:relief/data/repository/translations_repository.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/navigation/relief_router_delegate.dart';

final getIt = GetIt.instance;

void inject() {
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  getIt.registerLazySingleton<FacebookLogin>(() => FacebookLogin());

  getIt.registerLazySingleton<TranslationsRepository>(
      () => TranslationsRepository());
  getIt.registerFactory<SplashCubit>(() => SplashCubit(
        translationsRepository: getIt.get<TranslationsRepository>(),
        databaseRepository: getIt.get<DatabaseRepository>(),
      ));
  getIt.registerLazySingleton<SocialSignInRepository>(
      () => SocialSignInRepository());

  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt.get<SocialSignInRepository>()));
  getIt.registerLazySingleton<DatabaseRepository>(() => DatabaseRepository());
  getIt.registerLazySingleton<ReliefRouterDelegate>(
      () => ReliefRouterDelegate());
  getIt.registerLazySingleton<TranslationsHelper>(() => TranslationsHelper());
  getIt.registerLazySingleton<SharedPreferencesRepository>(
      () => SharedPreferencesRepository());
}
