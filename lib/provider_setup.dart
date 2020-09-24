import 'package:flutter/material.dart';
import 'package:hero_premier/ad/ad_service.dart';
import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/helpers/secured_storage_helper.dart';
import 'package:hero_premier/core/services/dashboard_service.dart';
import 'package:hero_premier/core/services/history_service.dart';
import 'package:hero_premier/core/services/leaderboard_service.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/services/winner_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: NavigationService()),
  Provider.value(value: ApiBaseHelper()),
  Provider.value(value: SecuredStorageHelper()),
  Provider.value(value: AdService())
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider2<ApiBaseHelper, SecuredStorageHelper, UserService>(
    update: (
      BuildContext context,
      ApiBaseHelper api,
      SecuredStorageHelper storageHelper,
      UserService userService,
    ) {
      return UserService(
        api: api,
        storageHelper: storageHelper,
      );
    },
    builder: (context, child) => child,
  ),
  ProxyProvider<ApiBaseHelper, LeaderboardService>(
    update: (context, api, service) => LeaderboardService(api: api),
  ),
  ProxyProvider<ApiBaseHelper, WinnerService>(
    update: (context, api, service) => WinnerService(api: api),
  ),
  ProxyProvider<ApiBaseHelper, HistoryService>(
    update: (context, api, service) => HistoryService(api: api),
  ),
  ProxyProvider<ApiBaseHelper, DashboardService>(
    update: (context, api, service) => DashboardService(api: api),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [];
