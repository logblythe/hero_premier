import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class LoginViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;
  bool _obscureText = true;

  LoginViewModel({
    @required NavigationService navigationService,
    @required UserService userService,
  })  : this._navigationService = navigationService,
        this._userService = userService;

  get obscureText => _obscureText;

//  Future<LoginResponse> login(String email, String password) async {
//    setBusy(true);
//    var loginResponse = await _userService.performLogin(email, password);
//    if (loginResponse.error != null) {
//      setError(loginResponse.error);
//    } else {
//      setBusy(false);
//    }
//    return loginResponse;
//  }

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void login(String email, String password) {
    _navigationService.navigateTo(RoutePaths.HOME);
  }
}
