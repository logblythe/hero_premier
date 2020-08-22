import 'dart:convert';
import 'dart:math';

import 'package:hero_premier/core/models/login/login_model.dart';
import 'package:hero_premier/core/services/api_helper.dart';
import 'package:hero_premier/core/services/shared_pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final ApiBaseHelper _api;

  UserService({ApiBaseHelper api}) : _api = api;

  login(postParams) {
    return _api.post("user/localLogin", postParams).then((value) {
      print('error $value');
        Map<String, dynamic> map = value;
        LoginModel loginModel = LoginModel.fromJson(map);
        SharedPrefHelper.sharedPreferences;

        SharedPrefHelper.setString(KEY_TOKEN, loginModel.token);
        SharedPrefHelper.setString(KEY_LOGIN, map.toString());
        SharedPrefHelper.setBool(KEY_SESSION, true);
    });
  }
}
