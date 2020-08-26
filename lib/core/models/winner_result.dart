import 'package:hero_premier/core/models/week_info.dart';

class WinnerResult {
  WeekInfo weekInfo;
  int obtainedScore;
  String matchTime;

	WinnerResult.fromJsonMap(Map<String, dynamic> map):
		weekInfo = WeekInfo.fromJsonMap(map["_id"]),
		obtainedScore = map["obtainedScore"],
		matchTime = map["matchTime"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = weekInfo == null ? null : weekInfo.toJson();
		data['obtainedScore'] = obtainedScore;
		data['matchTime'] = matchTime;
		return data;
	}
}
