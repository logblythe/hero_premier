
class Season {

  int currentMatchday;
  String endDate;
  int id;
  String startDate;
  Object winner;

	Season.fromJsonMap(Map<String, dynamic> map): 
		currentMatchday = map["currentMatchday"],
		endDate = map["endDate"],
		id = map["id"],
		startDate = map["startDate"],
		winner = map["winner"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['currentMatchday'] = currentMatchday;
		data['endDate'] = endDate;
		data['id'] = id;
		data['startDate'] = startDate;
		data['winner'] = winner;
		return data;
	}
}
