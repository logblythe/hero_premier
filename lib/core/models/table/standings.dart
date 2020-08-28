import 'package:hero_premier/core/models/table/league_data.dart';

class Standings {

  Object group;
  String stage;
  List<LeagueData> table;
  String type;

	Standings.fromJsonMap(Map<String, dynamic> map): 
		group = map["group"],
		stage = map["stage"],
		table = List<LeagueData>.from(map["table"].map((it) => LeagueData.fromJsonMap(it))),
		type = map["type"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['group'] = group;
		data['stage'] = stage;
		data['table'] = table != null ? 
			this.table.map((v) => v.toJson()).toList()
			: null;
		data['type'] = type;
		return data;
	}
}
