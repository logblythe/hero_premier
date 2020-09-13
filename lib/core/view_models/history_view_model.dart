import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/history/history_response.dart';
import 'package:hero_premier/core/models/history/history_result.dart';
import 'package:hero_premier/core/services/history_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/services/winner_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';

class HistoryViewModel extends BaseViewModel {
  final HistoryService _historyService;
  final UserService _userService;
  final WinnerService _winnerService;

  HistoryViewModel({
    @required HistoryService historyService,
    @required UserService userService,
    @required WinnerService winnerService,
  })  : this._historyService = historyService,
        this._userService = userService,
        this._winnerService = winnerService;

  int _page = 1;

  HistoryResponse get historyResponse => _historyService.historyResponse;

  List<HistoryResult> get historyResult =>
      _historyService.historyResponse.historyResult;

  Map<String, List<HistoryResult>> _gameWeekMap = {};

  Map<String, List<HistoryResult>> get gameWeekMap => _gameWeekMap;

  calculateGameWeek() {
    historyResult.forEach((e) {
      if (_gameWeekMap.containsKey(e.matchId.weekNo)) {
        _gameWeekMap[e.matchId.weekNo].add(e);
      } else {
        _gameWeekMap[e.matchId.weekNo] = [];
        _gameWeekMap[e.matchId.weekNo].add(e);
      }
    });
  }

  fetchHistory() async {
    setLoading();
    try {
      await _historyService.fetchHistory(1,
          {"userId": _winnerService.selectedWinnerId ?? _userService.userId});
      calculateGameWeek();
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  fetchHistoryMore() async {
    _page = _page + 1;
    setPaginating();
    try {
      await _historyService
          .fetchHistory(_page, {"userId": _userService.userId});
      calculateGameWeek();
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }
}
