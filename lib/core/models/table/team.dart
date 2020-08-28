
class Team {

  String crestUrl;
  int id;
  String name;

	Team.fromJsonMap(Map<String, dynamic> map): 
		crestUrl = map["crestUrl"],
		id = map["id"],
		name = map["name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['crestUrl'] = crestUrl;
		data['id'] = id;
		data['name'] = name;
		return data;
	}
}
