import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/models/history/history_response.dart';

class HistoryService {
  final ApiBaseHelper _api;

  HistoryService({ApiBaseHelper api}) : this._api = api;

  HistoryResponse _historyResponse;

  HistoryResponse get historyResponse => _historyResponse;

  fetchHistory(params) => _api
          .post("/prediction/getPastPredictionList/1/20", params: params)
          .then((res) {
        _historyResponse = HistoryResponse.fromJsonMap(res);
      });
}
