import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class ProfileViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  ProfileViewModel({
    @required UserService userService,
    @required NavigationService navigationService,
  })  : this._userService = userService,
        this._navigationService = navigationService;

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

  fetchUserDetails({String userId}) async {
    userId = "5d4819176f24b26dc40bd48f";
    try {
      setLoading();
      String _userId = userId ?? await _userService.getUserId();
      await _userService.fetchUserDetails(_userId);
      await _userService.fetchUserRank(_userId);
      setCompleted();
    } catch (e) {
      setError(e.toString());
    }
  }

  navigateSetting() => _navigationService.replace(RoutePaths.SETTING);
}
