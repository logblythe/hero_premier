import 'package:hero_premier/core/models/news/medium.dart';

class Sizes {

  Medium medium;

	Sizes.fromJsonMap(Map<String, dynamic> map): 
		medium = Medium.fromJsonMap(map["medium"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['medium'] = medium == null ? null : medium.toJson();
		return data;
	}
}
