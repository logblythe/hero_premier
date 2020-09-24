import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hero_premier/ad/ad_service.dart';
import 'package:hero_premier/core/models/news/news.dart';
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
  AdService _adService;

  DashboardViewModel({
    @required DashboardService dashboardService,
    @required NavigationService navigationService,
    @required UserService userService,
    @required AdService adService,
  })  : this._dashboardService = dashboardService,
        this._navigationService = navigationService,
        this._userService = userService,
        this._adService = adService;

  TableResponse get tableResponse => _dashboardService.tableResponse;

  get predictions => _dashboardService.predictionResponse.result;

  List<News> get newsList => _dashboardService.newsList;

  get selectedNews => _dashboardService.selectedNews;

  selectNews(index) {
    _dashboardService.selectNews(index);
    _adService.showBottomBannerAd();
    _navigationService
        .navigateTo(RoutePaths.NEWS_DETAILS)
        .then((value) => _adService.hideBottomBannerAd());
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
    setLoading();
    try {
      var _userId = _userService.userId;
      await _dashboardService.postPrediction({
        "userId": _userId,
        "matchId": matchId,
        "firstTeamScorePrediction": scoreA,
        "secondTeamScorePrediction": scoreB
      });
      setCompleted();
      Fluttertoast.showToast(
          msg: "Your prediction has been saved successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      setError(e);
      Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  fetchCurrentPrediction() async {
    setLoading();
    try {
      await _dashboardService.fetchCurrentPrediction({
        "userId": _userService.userId,
      });
      setCompleted();
    } catch (e) {
      setError(e.toJson());
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
      await _dashboardService
          .fetchPastPrediction({"userId": _userService.userId});
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  navigateFullTable() => _navigationService.navigateTo(RoutePaths.FULL_TABLE);

  showFullTable() {
    _adService.showBottomBannerAd();
    _navigationService
        .navigateTo(RoutePaths.FULL_TABLE)
        .then((value) => _adService.hideBottomBannerAd());
  }
}
