import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class SettingViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  SettingViewModel({
    @required UserService userService,
    @required NavigationService navigationService,
  })  : this._userService = userService,
        this._navigationService = navigationService;

  logout() async {
    try {
      setLoading();
      await _userService.logout();
      setCompleted();
      _navigationService.replace(RoutePaths.LOGIN);
    } catch (e) {
      setError(e);
    }
  }
}
