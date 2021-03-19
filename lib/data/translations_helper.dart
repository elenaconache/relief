import 'package:relief/data/model/translation.dart';
import 'package:relief/data/repository/shared_preferences_repository.dart';
import 'package:relief/dependency_injection.dart';

enum Language { ENGLISH, ROMANIAN }

class TranslationsHelper {
  List<Translation> _translations = [];
  Language currentLanguage;

  void setTranslations(List<Translation> translations) {
    _translations = translations;
  }

  List<Translation> getTranslations() {
    return _translations;
  }

  String getTranslation(String tag) {
    if (currentLanguage == Language.ROMANIAN) {
      return _translations
              .firstWhere(
                (element) => element.tag == tag,
                orElse: () => null,
              )
              ?.ro ??
          '';
    }
    return _translations
            .firstWhere(
              (element) => element.tag == tag,
              orElse: () => null,
            )
            ?.en ??
        '';
  }

  Future<void> setCurrentLanguage(Language currentLanguage) async {
    this.currentLanguage = currentLanguage;
    await getIt
        .get<SharedPreferencesRepository>()
        .saveString(keyCurrentLanguage, currentLanguage.toString());
  }

  Future<Language> getCurrentLanguage() async {
    if (currentLanguage == null) {
      currentLanguage = await getIt
                  .get<SharedPreferencesRepository>()
                  .getString(keyCurrentLanguage) ==
              Language.ROMANIAN.toString()
          ? Language.ROMANIAN
          : Language.ENGLISH;
    }
    return currentLanguage;
  }
}
