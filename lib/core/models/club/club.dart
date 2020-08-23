
class Club {

  String status;
  String _id;
  String name;
  String image;
  String createdAt;
  int __v;

	Club.fromJsonMap(Map<String, dynamic> map):
		status = map["status"],
		_id = map["_id"],
		name = map["name"],
		image = map["image"],
		createdAt = map["createdAt"],
		__v = map["__v"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['_id'] = _id;
		data['name'] = name;
		data['image'] = image;
		data['createdAt'] = createdAt;
		data['__v'] = __v;
		return data;
	}
}
