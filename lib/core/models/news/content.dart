
class Content {

  String rendered;
  bool protected;

	Content.fromJsonMap(Map<String, dynamic> map): 
		rendered = map["rendered"],
		protected = map["protected"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['rendered'] = rendered;
		data['protected'] = protected;
		return data;
	}
}
