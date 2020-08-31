import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/models/prediction/prediction_post_response.dart';
import 'package:hero_premier/core/models/prediction/prediction_response.dart';
import 'package:hero_premier/core/models/table/table_response.dart';

class DashboardService {
  final ApiBaseHelper _api;

  DashboardService({ApiBaseHelper api}) : this._api = api;

  TableResponse _tableResponse;
  PredictionResponse _predictionResponse;
  PostPredictionResponse _postPredictionResponse;

  TableResponse get tableResponse => _tableResponse;

  PredictionResponse get predictionResponse => _predictionResponse;

  PostPredictionResponse get postPredictionResponse => _postPredictionResponse;

  fetchTables() => _api
          .get(null, wholeUrl: "http://13.233.156.11:5000/fetchLeagueTable")
          .then((value) {
        _tableResponse = TableResponse.fromJsonMap(value);
      });

  postPrediction(params) =>
      _api.post("/prediction/addPrediction", params: params).then((value) {
        _postPredictionResponse = PostPredictionResponse.fromJsonMap(value);
      });

  fetchCurrentPrediction(params) => _api
          .post("/prediction/userPredictionList/1/20", params: params)
          .then((value) {
        _predictionResponse = PredictionResponse.fromJsonMap(value);
      });

  fetchPastPrediction(params) => _api
          .post("/prediction/getPastPredictionList/1/20", params: params)
          .then((value) {
        _predictionResponse = PredictionResponse.fromJsonMap(value);
      });
}
