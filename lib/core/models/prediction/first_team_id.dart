
class FirstTeamId {

  String _id;
  String name;
  String image;

	FirstTeamId.fromJsonMap(Map<String, dynamic> map): 
		_id = map["_id"],
		name = map["name"],
		image = map["image"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = _id;
		data['name'] = name;
		data['image'] = image;
		return data;
	}
}
