import 'package:cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:relief/blocs/splash/splash_states.dart';
import 'package:relief/data/repository/database_repository.dart';
import 'package:relief/data/repository/translations_repository.dart';

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
      emit(TranslationsSuccess());
      await databaseRepository.getTranslations();
    } catch (ex) {
      print(ex);
      emit(TranslationsError());
    }
  }
}
