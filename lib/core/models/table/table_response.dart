import 'package:hero_premier/core/models/table/competition.dart';
import 'package:hero_premier/core/models/table/filters.dart';
import 'package:hero_premier/core/models/table/season.dart';
import 'package:hero_premier/core/models/table/standings.dart';

class TableResponse {

  Competition competition;
  Filters filters;
  Season season;
  List<Standings> standings;

	TableResponse.fromJsonMap(Map<String, dynamic> map): 
		competition = Competition.fromJsonMap(map["competition"]),
		filters = Filters.fromJsonMap(map["filters"]),
		season = Season.fromJsonMap(map["season"]),
		standings = List<Standings>.from(map["standings"].map((it) => Standings.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['competition'] = competition == null ? null : competition.toJson();
		data['filters'] = filters == null ? null : filters.toJson();
		data['season'] = season == null ? null : season.toJson();
		data['standings'] = standings != null ? 
			this.standings.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
