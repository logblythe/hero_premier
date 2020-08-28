import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/models/winner_response.dart';

class WinnerService {
  final ApiBaseHelper _api;

  WinnerService({ApiBaseHelper api}) : this._api = api;

  WinnerResponse _winnerResponse;

  WinnerResponse get winnerResponse => _winnerResponse;

  String _selectedWinnerId;

  String get selectedWinnerId => _selectedWinnerId;

  setSelectedWinnerId(userId) => _selectedWinnerId = userId;

  fetchWinners() => _api.get("/prediction/weeklyWinner").then((res) {
        _winnerResponse = WinnerResponse.fromJsonMap(res);
      });

}
