import 'package:hero_premier/core/models/result.dart';

class IndividualDetail {

  String message;
  Result result;

	IndividualDetail.fromJsonMap(Map<String, dynamic> map): 
		message = map["message"],
		result = Result.fromJsonMap(map["result"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['message'] = message;
		data['result'] = result == null ? null : result.toJson();
		return data;
	}
}
