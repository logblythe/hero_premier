import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/table/season.dart';
import 'package:hero_premier/core/models/table/standings.dart';
import 'package:hero_premier/core/services/dashboard_service.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class DashboardViewModel extends BaseViewModel {
  DashboardService _dashboardService;
  NavigationService _navigationService;

  DashboardViewModel({
    @required NavigationService navigationService,
    @required DashboardService userService,
  })  : this._navigationService = navigationService,
        this._dashboardService = userService;

  List<Standings> get standings => _dashboardService.tableResponse.standings;

  Season get season => _dashboardService.tableResponse.season;

  fetchTables() async {
    if (_dashboardService.tableResponse == null) {
      setLoading();
      try {
        await _dashboardService.fetchTables();
        setCompleted();
      } catch (e) {
        setError(e.toJson());
      }
    }
  }

  navigateFullTable() => _navigationService.navigateTo(RoutePaths.FULL_TABLE);
}
