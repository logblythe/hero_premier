import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/models/news/news.dart';
import 'package:hero_premier/core/models/prediction/prediction_post_response.dart';
import 'package:hero_premier/core/models/prediction/prediction_response.dart';
import 'package:hero_premier/core/models/table/table_response.dart';
import 'package:hero_premier/core/models/todayList/today_response.dart';

class DashboardService {
  final ApiBaseHelper _api;

  DashboardService({ApiBaseHelper api}) : this._api = api;

  TableResponse _tableResponse;
  TodayResponse _todayResponse;
  PredictionResponse _predictionResponse;
  PostPredictionResponse _postPredictionResponse;
  List<News> _newsList;
  News _selectedNews;

  TableResponse get tableResponse => _tableResponse;

  TodayResponse get todayResponse => _todayResponse;

  PredictionResponse get predictionResponse => _predictionResponse;

  PostPredictionResponse get postPredictionResponse => _postPredictionResponse;

  List<News> get newsList => _newsList;

  News get selectedNews => _selectedNews;

  selectNews(index) {
    _selectedNews = _newsList.elementAt(index);
  }

  fetchTables() => _api
          .get(null, wholeUrl: "http://13.233.156.11:5000/fetchLeagueTable")
          .then((value) {
        _tableResponse = TableResponse.fromJsonMap(value);
      });

  postPrediction(params) =>
      _api.post("/prediction/addPrediction", params: params).then((value) {
        _postPredictionResponse = PostPredictionResponse.fromJsonMap(value);
      });

  fetchTodayPrediction(params) =>
      _api.post("/match/todayList/1/20", params: params).then((value) {
        _todayResponse = TodayResponse.fromJsonMap(value);
      });

  fetchPastPrediction(params) => _api
          .post("/prediction/getPastPredictionList/1/20", params: params)
          .then((value) {
        _predictionResponse = PredictionResponse.fromJsonMap(value);
      });

  fetchNews() => _api
      .get("",
          wholeUrl:
              "https://blog.premierhero.com/?rest_route=/wp/v2/posts&_embed")
      .then((value) =>
          _newsList = List.from(value.map((it) => News.fromJsonMap(it))));
}
