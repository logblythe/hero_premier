import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/news/news.dart';
import 'package:hero_premier/core/models/table/table_response.dart';
import 'package:hero_premier/core/models/todayList/today_result.dart';
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

  List<TodayResult> get todayPredictions => _dashboardService.todayResponse.result;

  get predictions => _dashboardService.predictionResponse.result;

  List<News> get newsList => _dashboardService.newsList;

  get selectedNews => _dashboardService.selectedNews;

  selectNews(index) {
    _dashboardService.selectNews(index);
    _navigationService.navigateTo(RoutePaths.NEWS_DETAILS);
  }

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
      await _dashboardService.fetchTodayPrediction(
          {"leagueCategoryId": "5d4d47c10ebd18405142e82d"});
      setCompleted();
    } catch (e) {
      setError(e.toString());
    }
  }

  fetchNews() async {
    if (_dashboardService.newsList == null) {
      setLoading();
      try {
        await _dashboardService.fetchNews();
        setCompleted();
      } catch (e) {
        setError(e.toString());
      }
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
