
class Title {

  String rendered;

	Title.fromJsonMap(Map<String, dynamic> map): 
		rendered = map["rendered"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['rendered'] = rendered;
		return data;
	}
}
