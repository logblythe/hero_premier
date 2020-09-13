import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/leaderboard/leaderboard.dart';
import 'package:hero_premier/core/services/leaderboard_service.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/winner_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class LeaderboardViewModel extends BaseViewModel {
  final LeaderboardService _leaderboardService;
  final WinnerService _winnerService;
  final NavigationService _navigationService;

  LeaderboardViewModel({
    @required LeaderboardService leaderboardService,
    @required NavigationService navigationService,
    @required WinnerService winnerService,
  })  : this._leaderboardService = leaderboardService,
        this._navigationService = navigationService,
        this._winnerService = winnerService;

  int _page = 1;

  List<Leaderboard> _leaderboards = [];

  List<Leaderboard> get leaderboards => _leaderboards;

  fetchLeaderboard() async {
    setLoading();
    try {
      await _leaderboardService.fetchLeaderboard(1);
      _leaderboards = _leaderboardService.leaderboardResponse.result;
      setCompleted();
    } catch (e) {
      setError(e.toJson());
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
      setError(e.toJson());
    }
  }

  selectWinner(String userId) {
    _winnerService.setSelectedWinnerId(userId);
    _navigationService.navigateTo(RoutePaths.WINNER_DETAIL);
  }
}
