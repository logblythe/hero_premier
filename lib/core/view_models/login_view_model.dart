import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

import 'file:///D:/Dinesh/Freelance/hero_premier/lib/core/models/login/login_model.dart';

class LoginViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  LoginViewModel({
    @required NavigationService navigationService,
    @required UserService userService,
  })  : this._navigationService = navigationService,
        this._userService = userService;

  bool _obscureText = true;

  get obscureText => _obscureText;

  LoginModel _loginModel;

  LoginModel get loginModel => _loginModel;

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void login(String email, String password) async {
    try {
      Map<String, dynamic> postParams = Map();
      postParams['email'] = email;
      postParams['password'] = password;
      log('data $postParams');
      print('data $postParams');
      setLoading();
      _loginModel = await _userService.login(postParams);
      setCompleted();
      _navigationService.navigateTo(RoutePaths.HOME);
    } catch (e) {
      setError(e);
    }
  }

  void register() {
    _navigationService.navigateTo(RoutePaths.REGISTER);
  }
}
