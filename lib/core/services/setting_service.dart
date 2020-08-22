import 'package:flutter/cupertino.dart';
import 'package:hero_premier/core/services/api_helper.dart';
import 'package:hero_premier/core/services/shared_pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService {
  final ApiBaseHelper _apiBaseHelper;
  SharedPreferences _sharedPreferences;

  SettingService({ApiBaseHelper apiBaseHelper})
      : _apiBaseHelper = apiBaseHelper;

  logout(token) async {
    print('token $token');

    return _apiBaseHelper.postWithToken("user/logout", null, token);
  }
}
