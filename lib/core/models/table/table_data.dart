import 'package:hero_premier/core/models/table/team.dart';

class TableData {

  int draw;
  Object form;
  int goalDifference;
  int goalsAgainst;
  int goalsFor;
  int lost;
  int playedGames;
  int points;
  int position;
  Team team;
  int won;

	TableData.fromJsonMap(Map<String, dynamic> map): 
		draw = map["draw"],
		form = map["form"],
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
		data['form'] = form;
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
