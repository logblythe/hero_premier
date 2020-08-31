import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/services/winner_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class ProfileViewModel extends BaseViewModel {
  NavigationService _navigationService;
  UserService _userService;
  WinnerService _winnerService;

  ProfileViewModel({
    @required NavigationService navigationService,
    @required UserService userService,
    @required WinnerService winnerService,
  })  : this._navigationService = navigationService,
        this._userService = userService,
        this._winnerService = winnerService;

  Future<User> getUserModel() async {
    return _userService.getUserModel();
  }

  User get user => _userService.user;

  updateProfile(String name, String dob, String gender, String address,
      String contact) async {
    try {
      setLoading();
      var response = await _userService.updateProfile({
        "userId": await _userService.getUserId(),
        "name": name,
        "address": address,
        "dob": dob,
        "phoneNumber": contact
      });
      setDialogContent(response);
      setCompleted();
    } catch (e) {
      setError(e.toString());
    }
  }

  fetchUserDetails() async {
    try {
      setLoading();
      String _userId =
          _winnerService.selectedWinnerId ?? await _userService.getUserId();
      await _userService.fetchUserDetails(_userId);
      await _userService.fetchUserRank(_userId);
      setCompleted();
    } catch (e) {
      setError(e.toString());
    }
  }

  navigateSetting() => _navigationService.replace(RoutePaths.SETTING);

  @override
  void dispose() {
    _winnerService.setSelectedWinnerId(null);
    super.dispose();
  }
}
