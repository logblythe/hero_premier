import 'package:hero_premier/core/models/winner_result.dart';

class WinnerResponse {
  String message;
  List<WinnerResult> result;

  WinnerResponse.fromJsonMap(Map<String, dynamic> map)
      : message = map["message"],
        result = List<WinnerResult>.from(
            map["result"].map((it) => WinnerResult.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['result'] =
        result != null ? this.result.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
