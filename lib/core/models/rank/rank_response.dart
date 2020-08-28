import 'package:hero_premier/core/models/rank/rank.dart';

class RankResponse {

  String message;
  List<Rank> rank;

	RankResponse.fromJsonMap(Map<String, dynamic> map): 
		message = map["message"],
		rank = List<Rank>.from(map["rank"].map((it) => Rank.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['message'] = message;
		data['rank'] = rank != null ? 
			this.rank.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
