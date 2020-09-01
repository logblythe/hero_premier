import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/table/table_response.dart';
import 'package:hero_premier/core/services/dashboard_service.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class DashboardViewModel extends BaseViewModel {
  DashboardService _dashboardService;
  NavigationService _navigationService;
  UserService _userService;

  DashboardViewModel({
    @required DashboardService dashboardService,
    @required NavigationService navigationService,
    @required UserService userService,
  })  : this._dashboardService = dashboardService,
        this._navigationService = navigationService,
        this._userService = userService;

  TableResponse get tableResponse => _dashboardService.tableResponse;

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
    //todo show a feedback in case of post success or failure
    setLoading();
    try {
      var _userId = await _userService.getUserId();
      await _dashboardService.postPrediction({
        "userId": _userId,
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
      var _userId = await _userService.getUserId();
      await _dashboardService.fetchCurrentPrediction({"userId": _userId});
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  fetchPastPrediction() async {
    setLoading();
    try {
      var _userId = await _userService.getUserId();
      await _dashboardService.fetchPastPrediction({"userId": _userId});
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  navigateFullTable() => _navigationService.navigateTo(RoutePaths.FULL_TABLE);
}
