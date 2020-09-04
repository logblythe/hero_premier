
class AvatarUrls {

  String twentyFour;
  String fortyEight;
  String ninetySix;

	AvatarUrls.fromJsonMap(Map<String, dynamic> map):
		twentyFour = map["24"],
		fortyEight = map["48"],
		ninetySix = map["96"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['24'] = twentyFour;
		data['48'] = fortyEight;
		data['96'] = ninetySix;
		return data;
	}
}
