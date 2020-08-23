import 'package:hero_premier/core/models/club/club.dart';

class ClubsResponse {
  List<Club> clubs;
  int current;
  int pages;
  int totalCount;

  ClubsResponse.fromJsonMap(Map<String, dynamic> map)
      : clubs =
            List<Club>.from(map["result"].map((it) => Club.fromJsonMap(it))),
        current = map["current"],
        pages = map["pages"],
        totalCount = map["totalCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] =
        clubs != null ? this.clubs.map((v) => v.toJson()).toList() : null;
    data['current'] = current;
    data['pages'] = pages;
    data['totalCount'] = totalCount;
    return data;
  }
}
