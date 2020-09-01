import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/leaderboard/leaderboard.dart';
import 'package:hero_premier/core/services/leaderboard_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';

class LeaderboardViewModel extends BaseViewModel {
  final LeaderboardService _leaderboardService;

  LeaderboardViewModel({@required LeaderboardService leaderboardService})
      : this._leaderboardService = leaderboardService;

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
}
