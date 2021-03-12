import 'package:shared_preferences/shared_preferences.dart';

const keyCurrentLanguage = 'currentLanguage';
const keyCurrentToken = 'userToken';

class SharedPreferencesRepository {
  Future<void> saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
