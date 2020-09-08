import 'package:hero_premier/core/models/todayList/first_team_id.dart';
import 'package:hero_premier/core/models/todayList/league_category_id.dart';
import 'package:hero_premier/core/models/todayList/second_team_id.dart';
import 'package:hero_premier/core/models/todayList/stadium.dart';

class TodayResult {
  List<String> users;
  String status;
  String id;
  FirstTeamId firstTeamId;
  SecondTeamId secondTeamId;
  Stadium stadium;
  String weekNo;
  String matchTime;
  LeagueCategoryId leagueCategoryId;
  String createdAt;
  int __v;

  TodayResult.fromJsonMap(Map<String, dynamic> map)
      : users = List<String>.from(map["users"]),
        status = map["status"],
        id = map["_id"],
        firstTeamId = FirstTeamId.fromJsonMap(map["firstTeamId"]),
        secondTeamId = SecondTeamId.fromJsonMap(map["secondTeamId"]),
        stadium = Stadium.fromJsonMap(map["stadium"]),
        weekNo = map["weekNo"],
        matchTime = map["matchTime"],
        leagueCategoryId =
            LeagueCategoryId.fromJsonMap(map["leagueCategoryId"]),
        createdAt = map["createdAt"],
        __v = map["__v"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users'] = users;
    data['status'] = status;
    data['_id'] = id;
    data['firstTeamId'] = firstTeamId == null ? null : firstTeamId.toJson();
    data['secondTeamId'] = secondTeamId == null ? null : secondTeamId.toJson();
    data['stadium'] = stadium == null ? null : stadium.toJson();
    data['weekNo'] = weekNo;
    data['matchTime'] = matchTime;
    data['leagueCategoryId'] =
        leagueCategoryId == null ? null : leagueCategoryId.toJson();
    data['createdAt'] = createdAt;
    data['__v'] = __v;
    return data;
  }
}
