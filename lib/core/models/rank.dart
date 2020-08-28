
class Rank {

  int _id;
  int rank;
  String userId;
  int totalPointEarned;

	Rank.fromJsonMap(Map<String, dynamic> map): 
		_id = map["_id"],
		rank = map["rank"],
		userId = map["userId"],
		totalPointEarned = map["totalPointEarned"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = _id;
		data['rank'] = rank;
		data['userId'] = userId;
		data['totalPointEarned'] = totalPointEarned;
		return data;
	}
}
