import 'package:hero_premier/core/models/table/team.dart';

class LeagueData {

  int draw;
  int goalDifference;
  int goalsAgainst;
  int goalsFor;
  int lost;
  int playedGames;
  int points;
  int position;
  Team team;
  int won;

	LeagueData.fromJsonMap(Map<String, dynamic> map):
		draw = map["draw"],
		goalDifference = map["goalDifference"],
		goalsAgainst = map["goalsAgainst"],
		goalsFor = map["goalsFor"],
		lost = map["lost"],
		playedGames = map["playedGames"],
		points = map["points"],
		position = map["position"],
		team = Team.fromJsonMap(map["team"]),
		won = map["won"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['draw'] = draw;
		data['goalDifference'] = goalDifference;
		data['goalsAgainst'] = goalsAgainst;
		data['goalsFor'] = goalsFor;
		data['lost'] = lost;
		data['playedGames'] = playedGames;
		data['points'] = points;
		data['position'] = position;
		data['team'] = team == null ? null : team.toJson();
		data['won'] = won;
		return data;
	}
}
