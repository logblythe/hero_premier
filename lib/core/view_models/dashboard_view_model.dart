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

  get predictions => _dashboardService.predictionResponse.result;

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

  postPrediction(String scoreA, String scoreB, String matchId) async {
    setLoading();
    try {
      await _dashboardService.postPrediction({
        "userId": "5d45bc0e6f24b26dc40bd462",
        "matchId": matchId,
        "firstTeamScorePrediction": scoreA,
        "secondTeamScorePrediction": scoreB
      });
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  fetchCurrentPrediction() async {
    setLoading();
    try {
      await _dashboardService
          .fetchCurrentPrediction({"userId": "5d45bc0e6f24b26dc40bd462"});
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  fetchPastPrediction() async {
    setLoading();
    try {
      await _dashboardService
          .fetchPastPrediction({"userId": "5d45bc0e6f24b26dc40bd462"});
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  navigateFullTable() => _navigationService.navigateTo(RoutePaths.FULL_TABLE);
}
