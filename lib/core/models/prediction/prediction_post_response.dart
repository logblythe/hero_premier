class PostPredictionResponse {
  String message;
  PredictionResult result;

  PostPredictionResponse.fromJsonMap(Map<String, dynamic> map)
      : message = map["message"],
        result = PredictionResult.fromJsonMap(map["result"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['result'] = result == null ? null : result.toJson();
    return data;
  }
}

class PredictionResult {
  int obtainedScore;
  String id;
  String matchId;
  String userId;
  int firstTeamScorePrediction;
  int secondTeamScorePrediction;
  String createdAt;
  int __v;

  PredictionResult.fromJsonMap(Map<String, dynamic> map)
      : obtainedScore = map["obtainedScore"],
        id = map["_id"],
        matchId = map["matchId"],
        userId = map["userId"],
        firstTeamScorePrediction = map["firstTeamScorePrediction"],
        secondTeamScorePrediction = map["secondTeamScorePrediction"],
        createdAt = map["createdAt"],
        __v = map["__v"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['obtainedScore'] = obtainedScore;
    data['_id'] = id;
    data['matchId'] = matchId;
    data['userId'] = userId;
    data['firstTeamScorePrediction'] = firstTeamScorePrediction;
    data['secondTeamScorePrediction'] = secondTeamScorePrediction;
    data['createdAt'] = createdAt;
    data['__v'] = __v;
    return data;
  }
}
