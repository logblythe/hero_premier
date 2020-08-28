import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/models/leaderboard/leaderboard_response.dart';

class LeaderboardService {
  final ApiBaseHelper _api;

  LeaderboardService({ApiBaseHelper api}) : this._api = api;

  LeaderboardResponse _leaderboardResponse;

  LeaderboardResponse get leaderboardResponse => _leaderboardResponse;

  fetchLeaderboard() => _api.get("/user/leaderboardRank/1/20").then((res) {
        _leaderboardResponse = LeaderboardResponse.fromJsonMap(res);
      });
}
