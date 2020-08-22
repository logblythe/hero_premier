import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/api_helper.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/setting_service.dart';
import 'package:hero_premier/core/services/shared_pref_helper.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: NavigationService()),
  Provider.value(value: SharedPrefHelper()),
  Provider.value(value: ApiBaseHelper()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<ApiBaseHelper, UserService>(
    update:
        (BuildContext context, ApiBaseHelper api, UserService userService) =>
            UserService(api: api),
  ),
  ProxyProvider<ApiBaseHelper, SettingService>(
    update:
        (BuildContext context, ApiBaseHelper api, SettingService settingService) =>
        SettingService(apiBaseHelper: api),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [];
