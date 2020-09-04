import 'package:hero_premier/core/models/news/sizes.dart';

class MediaDetails {

  int width;
  int height;
  String file;
  Sizes sizes;

	MediaDetails.fromJsonMap(Map<String, dynamic> map):
		width = map["width"],
		height = map["height"],
		file = map["file"],
		sizes = Sizes.fromJsonMap(map["sizes"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['width'] = width;
		data['height'] = height;
		data['file'] = file;
		data['sizes'] = sizes == null ? null : sizes.toJson();
		return data;
	}
}
