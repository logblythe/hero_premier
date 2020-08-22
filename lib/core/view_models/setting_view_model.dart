import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/setting_service.dart';
import 'package:hero_premier/core/services/shared_pref_helper.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingViewModel extends BaseViewModel {
  SettingService _settingService;
  NavigationService _navigationService;

  SettingViewModel({
    @required SettingService settingService,
    @required NavigationService navigationService,
  })  : this._settingService = settingService,
        this._navigationService = navigationService;

  void logout(token) async {
    try {
      setLoading();
      await _settingService.logout(token);
      setCompleted();
      SharedPrefHelper.clear();
      _navigationService.replace(RoutePaths.LOGIN);
    } catch (e) {
      setError(e);
    }
  }
}
