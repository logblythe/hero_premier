import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/leaderboard/leaderboard.dart';
import 'package:hero_premier/core/models/login/login_result.dart';
import 'package:hero_premier/core/models/rank/rank_response.dart';
import 'package:hero_premier/core/services/leaderboard_service.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/services/winner_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class LeaderboardViewModel extends BaseViewModel {
  final LeaderboardService _leaderboardService;
  final NavigationService _navigationService;
  final UserService _userService;
  final WinnerService _winnerService;

  LeaderboardViewModel({
    @required LeaderboardService leaderboardService,
    @required NavigationService navigationService,
    @required UserService userService,
    @required WinnerService winnerService,
  })  : this._leaderboardService = leaderboardService,
        this._navigationService = navigationService,
        this._userService = userService,
        this._winnerService = winnerService;

  int _page = 1;
  List<Leaderboard> _leaderboards = [];

  List<Leaderboard> get leaderboards => _leaderboards;

  RankResponse get rankResponse => _userService.rankResponse;

  LoginResult get loginResult => _userService.loginModel.result;

  fetchLeaderboard() async {
    setLoading();
    try {
      await _leaderboardService.fetchLeaderboard(1);
      _leaderboards = _leaderboardService.leaderboardResponse.result;
      setCompleted();
    } catch (e) {
      setError(e);
    }
  }

  fetchLeaderboardMore() async {
    _page = _page + 1;
    setPaginating();
    try {
      await _leaderboardService.fetchLeaderboard(_page);
      _leaderboards.addAll(_leaderboardService.leaderboardResponse.result);
      setCompleted();
    } catch (e) {
      setError(e);
    }
  }

  selectWinner(String userId) {
    _winnerService.setSelectedWinnerId(userId);
    _navigationService.navigateTo(RoutePaths.WINNER_DETAIL);
  }

  fetchLeaderBoardIndividual() {
    setLoading();
    try {
      _userService.fetchUserRank(_userService.userId);
      setCompleted();
    } catch (e) {
      setError(e);
    }
  }
}
