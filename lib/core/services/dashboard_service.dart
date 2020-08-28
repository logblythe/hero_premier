import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/models/table/table_response.dart';

class DashboardService {
  final ApiBaseHelper _api;

  DashboardService({ApiBaseHelper api}) : this._api = api;

  TableResponse _tableResponse;

  TableResponse get tableResponse => _tableResponse;

  fetchTables() => _api
          .get(null, wholeUrl: "http://13.233.156.11:5000/fetchLeagueTable")
          .then((value) {
        _tableResponse = TableResponse.fromJsonMap(value);
      });
}
