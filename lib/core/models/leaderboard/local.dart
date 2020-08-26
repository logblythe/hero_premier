
class Local {
  String name;
  String image;

	Local.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"] ,
		image = map["image"] ?? "https://via.placeholder.com/150";

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['image'] = image;
		return data;
	}
}
