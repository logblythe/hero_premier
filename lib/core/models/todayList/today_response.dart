import 'package:hero_premier/core/models/todayList/today_result.dart';

class TodayResponse {
  List<TodayResult> result;
  int current;
  int pages;
  int totalCount;

  TodayResponse.fromJsonMap(Map<String, dynamic> map)
      : result = List<TodayResult>.from(
            map["result"].map((it) => TodayResult.fromJsonMap(it))),
        current = map["current"],
        pages = map["pages"],
        totalCount = map["totalCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] =
        result != null ? this.result.map((v) => v.toJson()).toList() : null;
    data['current'] = current;
    data['pages'] = pages;
    data['totalCount'] = totalCount;
    return data;
  }
}
