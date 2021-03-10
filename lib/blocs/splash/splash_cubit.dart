import 'package:cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:relief/blocs/splash/splash_states.dart';
import 'package:relief/data/repository/database_repository.dart';
import 'package:relief/data/repository/translations_repository.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';

class SplashCubit extends CubitStream<SplashState> {
  final TranslationsRepository translationsRepository;
  final DatabaseRepository databaseRepository;

  SplashCubit(
      {@required this.translationsRepository,
      @required this.databaseRepository})
      : assert(translationsRepository != null && databaseRepository != null),
        super(SplashInitial());

  void getTranslations() async {
    emit(TranslationsLoading());
    try {
      var translations = await translationsRepository.getTranslations();
      await databaseRepository.insertTranslations(translations);
      getIt
          .get<TranslationsHelper>()
          .setTranslations(await databaseRepository.getTranslations());
      await getIt.get<TranslationsHelper>().getCurrentLanguage();
      emit(TranslationsSuccess());
    } catch (ex) {
      print(ex);
      await databaseRepository.getTranslations();
      emit(TranslationsError());
    }
  }
}
