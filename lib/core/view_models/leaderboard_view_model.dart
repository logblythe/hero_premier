import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/leaderboard/leaderboard.dart';
import 'package:hero_premier/core/services/leaderboard_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';

class LeaderboardViewModel extends BaseViewModel {
  final LeaderboardService _leaderboardService;

  LeaderboardViewModel({@required LeaderboardService leaderboardService})
      : this._leaderboardService = leaderboardService;

  List<Leaderboard> get leaderboards =>
      _leaderboardService.leaderboardResponse.result;

  fetchLeaderboard() async {
    setLoading();
    try {
      await _leaderboardService.fetchLeaderboard();
      setCompleted();
    } catch (e) {
      setError(e.toString());
    }
  }
}
