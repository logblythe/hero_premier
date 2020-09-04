import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  Map<String, bool> _obscure = {
    "oldPassword": true,
    "newPassword": true,
    "confirmPassword": true,
  };
  String _passwordNotMatchError;

  Map<String, bool> get obscure => _obscure;

  String get passwordNotMatchError => _passwordNotMatchError;

  void setPasswordNotMatchError(String value) {
    _passwordNotMatchError = value;
    notifyListeners();
  }

  void toggleOldPassword() {
    _obscure["oldPassword"] = !_obscure["oldPassword"];
    notifyListeners();
  }

  void toggleNewPassword() {
    _obscure["newPassword"] = !_obscure["newPassword"];
    notifyListeners();
  }

  void toggleConfirmPassword() {
    _obscure["confirmPassword"] = !_obscure["confirmPassword"];
    notifyListeners();
  }

  void changePassword(String oldPassword, String newPassword) async {
    setLoading();
    try {
      await _userService.changePassword(
        {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
          "userId": _userService.loginModel?.result?.id
        },
      );
      Fluttertoast.showToast(
          msg: "Password changed successful.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.withOpacity(0.9),
          textColor: Colors.white,
          fontSize: 16.0);
      _navigationService.goBack();
    } catch (e) {
      // AppException exception = e.toJson();
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    setCompleted();
  }
}
