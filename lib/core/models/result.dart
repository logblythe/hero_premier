import 'package:hero_premier/core/models/local.dart';

class Result {

  dynamic local;
  int points;
  String _id;

	Result.fromJsonMap(Map<String, dynamic> map): 
		local = Local.fromJsonMap(map["local"] ?? map['facebook']),
		points = map["points"],
		_id = map["_id"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['local'] = local == null ? null : local.toJson();
		data['points'] = points;
		data['_id'] = _id;
		return data;
	}
}
