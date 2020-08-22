import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

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

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  login(String email, String password) async {
    try {
      setLoading();
      await _userService.login({"email": email, "password": password});
      setCompleted();
      _navigationService.navigateTo(RoutePaths.HOME);
    } catch (e) {
      setError(e.toString());
    }
  }

  void register() {
    _navigationService.navigateTo(RoutePaths.REGISTER);
  }
}
