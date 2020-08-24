import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/login/local.dart';
import 'package:hero_premier/core/models/login/login_model.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';

import '../../router.dart';
import 'base_view_model.dart';

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

  updateProfile(String name, String dob, String gender, String address,
      String contact) async {
    try {
      setLoading();
      var response = await _userService.updateProfile({
        "userId": _userService.getUserId(),
        "name": name,
        "address": address,
        "dob": dob,
        "phoneNumber": contact
      });
      setDialogContent(response);
      setCompleted();
    } catch (e) {
      setError(e.toJson());
    }
  }

  navigateSetting() => _navigationService.replace(RoutePaths.SETTING);
}
