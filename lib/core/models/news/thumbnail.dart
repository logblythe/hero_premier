
class Thumbnail {

  String file;
  int width;
  int height;
  String mime_type;
  String source_url;

	Thumbnail.fromJsonMap(Map<String, dynamic> map): 
		file = map["file"],
		width = map["width"],
		height = map["height"],
		mime_type = map["mime_type"],
		source_url = map["source_url"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['file'] = file;
		data['width'] = width;
		data['height'] = height;
		data['mime_type'] = mime_type;
		data['source_url'] = source_url;
		return data;
	}
}
