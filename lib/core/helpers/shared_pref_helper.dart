import 'package:shared_preferences/shared_preferences.dart';

const String KEY_USER_ID = "key_user_id";
const String KEY_TOKEN = "key_token";
const String KEY_FREE_QUES_COUNT = "key_free_question_count";
const String KEY_DARK_MODE_ENABLED = "key_dark_mode_enabled";
const String KEY_IMAGE_URL = "key_image_url";
const String KEY_LOGIN = "key_login_json";
const String KEY_SESSION = "key_session";
const String KEY_USER="key_user";
const String KEY_SOCIAL="key_social";

class SharedPrefHelper {
  SharedPreferences _sharedPreferences;

  Future<SharedPreferences> get sharedPreferences async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _sharedPreferences;
  }

  setString(String key, String value) async {
    var sharedPref = await sharedPreferences;
    sharedPref.setString(key, value);
  }

  Future<String> getString(String key) async {
    var sharedPref = await sharedPreferences;
    return sharedPref.get(key) ?? Future.value("");
  }

  setInt(String key, int value) async {
    var sharedPref = await sharedPreferences;
    sharedPref.setInt(key, value);
  }

  getInteger(String key) async {
    var sharedPref = await sharedPreferences;
    return sharedPref.getInt(key) ?? Future.value(0);
  }

  setBool(String key, bool value) async {
    var sharedPref = await sharedPreferences;
    sharedPref.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    var sharedPref = await sharedPreferences;
    return sharedPref.getBool(key) ?? Future.value(false);
  }

  void clear() async {
    var sharedPref = await sharedPreferences;
    sharedPref.clear();
  }
}
