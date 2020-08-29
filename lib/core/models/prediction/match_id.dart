import 'package:hero_premier/core/models/prediction/first_team_id.dart';
import 'package:hero_premier/core/models/prediction/second_team_id.dart';
import 'package:hero_premier/core/models/prediction/league_category_id.dart';

class MatchId {

  String id;
  FirstTeamId firstTeamId;
  SecondTeamId secondTeamId;
  String matchTime;
  LeagueCategoryId leagueCategoryId;

	MatchId.fromJsonMap(Map<String, dynamic> map): 
		id = map["_id"],
		firstTeamId = FirstTeamId.fromJsonMap(map["firstTeamId"]),
		secondTeamId = SecondTeamId.fromJsonMap(map["secondTeamId"]),
		matchTime = map["matchTime"],
		leagueCategoryId = LeagueCategoryId.fromJsonMap(map["leagueCategoryId"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = id;
		data['firstTeamId'] = firstTeamId == null ? null : firstTeamId.toJson();
		data['secondTeamId'] = secondTeamId == null ? null : secondTeamId.toJson();
		data['matchTime'] = matchTime;
		data['leagueCategoryId'] = leagueCategoryId == null ? null : leagueCategoryId.toJson();
		return data;
	}
}
