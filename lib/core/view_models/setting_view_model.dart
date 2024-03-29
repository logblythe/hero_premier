import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

import '../../router.dart';

class SettingViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  SettingViewModel({
    @required UserService userService,
    @required NavigationService navigationService,
  })  : this._userService = userService,
        this._navigationService = navigationService;

  get user =>
      _userService.loginModel.result.local ??
      _userService.loginModel.result.facebook;

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

  navigateToChangePassword() =>
      _navigationService.navigateTo(RoutePaths.CHANGE_PASSWORD);

  navigateToProfile() => _navigationService.navigateTo(RoutePaths.PROFILE);

  navigateToCreateGroup() =>
      _navigationService.navigateTo(RoutePaths.CREATE_GROUP);

  launchInWebViewWithJavaScript(String url, String title) async {
    List<String> args = List();
    args.add(url);
    args.add(title);

    _navigationService.navigateTo(RoutePaths.WEBVIEW, arguments: args);
  }
}
