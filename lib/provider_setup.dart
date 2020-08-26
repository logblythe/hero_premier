import 'package:flutter/material.dart';
import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/helpers/shared_pref_helper.dart';
import 'package:hero_premier/core/services/leaderboard_service.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
  ProxyProvider2<ApiBaseHelper, SharedPrefHelper, UserService>(
    update: (BuildContext context, ApiBaseHelper api,
            SharedPrefHelper prefHelper, UserService userService) =>
        UserService(api: api, prefHelper: prefHelper),
  ),
  ProxyProvider<ApiBaseHelper, LeaderboardService>(
    update: (context, api, service) => LeaderboardService(api: api),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [];
