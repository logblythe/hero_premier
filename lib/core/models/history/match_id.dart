import 'package:hero_premier/core/models/history/first_team_id.dart';
import 'package:hero_premier/core/models/history/second_team_id.dart';
import 'package:hero_premier/core/models/history/league_category_id.dart';

class MatchId {

  String _id;
  FirstTeamId firstTeamId;
  SecondTeamId secondTeamId;
  String weekNo;
  String matchTime;
  LeagueCategoryId leagueCategoryId;
  int firstTeamScore;
  int secondTeamScore;

	MatchId.fromJsonMap(Map<String, dynamic> map): 
		_id = map["_id"],
		firstTeamId = FirstTeamId.fromJsonMap(map["firstTeamId"]),
		secondTeamId = SecondTeamId.fromJsonMap(map["secondTeamId"]),
		weekNo = map["weekNo"],
		matchTime = map["matchTime"],
		leagueCategoryId = LeagueCategoryId.fromJsonMap(map["leagueCategoryId"]),
		firstTeamScore = map["firstTeamScore"],
		secondTeamScore = map["secondTeamScore"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = _id;
		data['firstTeamId'] = firstTeamId == null ? null : firstTeamId.toJson();
		data['secondTeamId'] = secondTeamId == null ? null : secondTeamId.toJson();
		data['weekNo'] = weekNo;
		data['matchTime'] = matchTime;
		data['leagueCategoryId'] = leagueCategoryId == null ? null : leagueCategoryId.toJson();
		data['firstTeamScore'] = firstTeamScore;
		data['secondTeamScore'] = secondTeamScore;
		return data;
	}
}
