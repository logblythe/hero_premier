import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';

class ChangePasswordViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  ChangePasswordViewModel({
    @required UserService userService,
    @required NavigationService navigationService,
  })  : this._userService = userService,
        this._navigationService = navigationService;

  bool _obscureText = true;

  get obscureText => _obscureText;

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
