
class Stadium {
  String id;
  String name;

	Stadium.fromJsonMap(Map<String, dynamic> map): 
		id = map["_id"],
		name = map["name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = id;
		data['name'] = name;
		return data;
	}
}