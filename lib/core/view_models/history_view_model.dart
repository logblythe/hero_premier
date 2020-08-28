import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/history/history_response.dart';
import 'package:hero_premier/core/models/history/history_result.dart';
import 'package:hero_premier/core/services/history_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';

class HistoryViewModel extends BaseViewModel {
  final HistoryService _historyService;
  final UserService _userService;

  HistoryViewModel({
    @required HistoryService historyService,
    @required UserService userService,
  })
      : this._historyService = historyService,
        this._userService = userService;

  HistoryResponse get historyResponse => _historyService.historyResponse;

  List<HistoryResult> get historyResult =>
      _historyService.historyResponse.historyResult;

  Map<String, List<HistoryResult>> _gameWeekMap = {};
  Map<String, List<HistoryResult>> get gameWeekMap=>_gameWeekMap;

  calculateGameWeek() {
    historyResult.forEach((e) {
      if (_gameWeekMap.containsKey(e.matchId.weekNo)) {
        _gameWeekMap[e.matchId.weekNo].add(e);
      } else {
        _gameWeekMap[e.matchId.weekNo]=[];
        _gameWeekMap[e.matchId.weekNo].add(e);
      }
    });
  }

  fetchHistory({String userId}) async {
    setLoading();
    try {
      // var _userId = userId ?? await _userService.getUserId();
      var _userId = "5d4819176f24b26dc40bd48f";
      await _historyService.fetchHistory({"userId": _userId});
      calculateGameWeek();
      setCompleted();
    } catch (e) {
      setError(e.toString());
    }
  }
}
