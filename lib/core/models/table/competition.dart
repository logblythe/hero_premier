import 'package:hero_premier/core/models/table/area.dart';

class Competition {

  Area area;
  String code;
  int id;
  String lastUpdated;
  String name;
  String plan;

	Competition.fromJsonMap(Map<String, dynamic> map): 
		area = Area.fromJsonMap(map["area"]),
		code = map["code"],
		id = map["id"],
		lastUpdated = map["lastUpdated"],
		name = map["name"],
		plan = map["plan"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['area'] = area == null ? null : area.toJson();
		data['code'] = code;
		data['id'] = id;
		data['lastUpdated'] = lastUpdated;
		data['name'] = name;
		data['plan'] = plan;
		return data;
	}
}
