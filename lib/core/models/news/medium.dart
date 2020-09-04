
class Medium {

  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;

	Medium.fromJsonMap(Map<String, dynamic> map): 
		file = map["file"],
		width = map["width"],
		height = map["height"],
		mimeType = map["mime_type"],
		sourceUrl = map["source_url"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['file'] = file;
		data['width'] = width;
		data['height'] = height;
		data['mime_type'] = mimeType;
		data['source_url'] = sourceUrl;
		return data;
	}
}
