
class ImageUpload {

  String message;
  String result;

	ImageUpload.fromJsonMap(Map<String, dynamic> map): 
		message = map["message"],
		result = map["result"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['message'] = message;
		data['result'] = result;
		return data;
	}
}
