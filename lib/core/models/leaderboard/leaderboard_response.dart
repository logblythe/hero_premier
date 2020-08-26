import 'package:hero_premier/core/models/leaderboard/leaderboard.dart';

class LeaderboardResponse {
  List<Leaderboard> result;
  int current;
  int pages;
  int totalCount;

	LeaderboardResponse.fromJsonMap(Map<String, dynamic> map):
		result = List<Leaderboard>.from(map["result"].map((it) => Leaderboard.fromJsonMap(it))),
		current = map["current"],
		pages = map["pages"],
		totalCount = map["totalCount"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['result'] = result != null ? 
			this.result.map((v) => v.toJson()).toList()
			: null;
		data['current'] = current;
		data['pages'] = pages;
		data['totalCount'] = totalCount;
		return data;
	}
}
