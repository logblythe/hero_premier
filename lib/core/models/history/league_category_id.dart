
class LeagueCategoryId {

  String _id;
  String name;

	LeagueCategoryId.fromJsonMap(Map<String, dynamic> map): 
		_id = map["_id"],
		name = map["name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = _id;
		data['name'] = name;
		return data;
	}
}
