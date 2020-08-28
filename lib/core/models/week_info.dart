import 'package:hero_premier/core/models/winner_info.dart';

class WeekInfo {
  String id;
  WinnerInfo winnerInfo;

  WeekInfo.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        winnerInfo = WinnerInfo.fromJsonMap(map["userId"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = winnerInfo == null ? null : winnerInfo.toJson();
    return data;
  }
}
