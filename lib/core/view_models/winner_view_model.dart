import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/winner_result.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/winner_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class WinnerViewModel extends BaseViewModel {
  final WinnerService _winnerService;
  final NavigationService _navigationService;

  WinnerViewModel(
      {@required WinnerService winnerService,
      @required NavigationService navigationService})
      : this._winnerService = winnerService,
        this._navigationService = navigationService;

  List<WinnerResult> get winners => _winnerService.winnerResponse.result;

  fetchWinners() async {
    setLoading();
    try {
      await _winnerService.fetchWinners();
      setCompleted();
    } catch (e) {
      setError(e.toString());
    }
  }

  selectWinner(String userId) {
    _winnerService.setSelectedWinnerId(userId);
    _navigationService.navigateTo(RoutePaths.WINNER_DETAIL);
  }
}
