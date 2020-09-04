import 'package:hero_premier/core/models/news/avatar_urls.dart';

class Author {

  String name;
  AvatarUrls avatarUrls;

	Author.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		avatarUrls = AvatarUrls.fromJsonMap(map["avatar_urls"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['avatar_urls'] = avatarUrls == null ? null : avatarUrls.toJson();
		return data;
	}
}
