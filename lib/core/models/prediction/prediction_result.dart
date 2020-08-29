import 'package:hero_premier/core/models/prediction/match_id.dart';

class PredictionResult {

  int obtainedScore;
  String _id;
  MatchId matchId;
  String userId;
  int firstTeamScorePrediction;
  int secondTeamScorePrediction;
  String createdAt;
  int __v;

	PredictionResult.fromJsonMap(Map<String, dynamic> map):
		obtainedScore = map["obtainedScore"],
		_id = map["_id"],
		matchId = MatchId.fromJsonMap(map["matchId"]),
		userId = map["userId"],
		firstTeamScorePrediction = map["firstTeamScorePrediction"],
		secondTeamScorePrediction = map["secondTeamScorePrediction"],
		createdAt = map["createdAt"],
		__v = map["__v"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['obtainedScore'] = obtainedScore;
		data['_id'] = _id;
		data['matchId'] = matchId == null ? null : matchId.toJson();
		data['userId'] = userId;
		data['firstTeamScorePrediction'] = firstTeamScorePrediction;
		data['secondTeamScorePrediction'] = secondTeamScorePrediction;
		data['createdAt'] = createdAt;
		data['__v'] = __v;
		return data;
	}
}
