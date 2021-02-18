import 'package:flutter/material.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class ClubViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  ClubViewModel({
    @required NavigationService navigationService,
    @required UserService userService,
  })  : this._navigationService = navigationService,
        this._userService = userService;

  get clubs => _userService.clubs;

  fetchClubs() async {
    setLoading();
    try {
      await _userService.fetchClubs();
      setCompleted();
    } catch (e) {
      setError(e);
    }
  }

  selectClub() {
    //TODO : send selected club to BE
    navigateLogin();
  }

  navigateLogin() => _navigationService.replace(RoutePaths.LOGIN);
}
