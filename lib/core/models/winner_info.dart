import 'package:hero_premier/core/models/leaderboard/local.dart';

class WinnerInfo {
  Local local;
  int points;
  String id;

  WinnerInfo.fromJsonMap(Map<String, dynamic> map)
      : local = Local.fromJsonMap(map["facebook"] ?? map['local']),
        points = map["points"],
        id = map["_id"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['local'] = local == null ? null : local.toJson();
    data['points'] = points;
    data['_id'] = id;
    return data;
  }
}
