import 'package:hero_premier/core/models/history/history_result.dart';

class HistoryResponse {
  List<HistoryResult> historyResult;
  int current;
  int pages;
  int totalCount;

  HistoryResponse.fromJsonMap(Map<String, dynamic> map)
      : historyResult = List<HistoryResult>.from(
            map["result"].map((it) => HistoryResult.fromJsonMap(it))),
        current = map["current"],
        pages = map["pages"],
        totalCount = map["totalCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = historyResult != null
        ? this.historyResult.map((v) => v.toJson()).toList()
        : null;
    data['current'] = current;
    data['pages'] = pages;
    data['totalCount'] = totalCount;
    return data;
  }
}
