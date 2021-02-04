import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';
import 'package:hero_premier/router.dart';

class RegisterViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  RegisterViewModel({
    @required NavigationService navigationService,
    @required UserService userService,
  })  : this._navigationService = navigationService,
        this._userService = userService;

  checkUniqueMail(String email) async {
    setLoading();
    try {
      await _userService.checkUniqueMail(email);
      setCompleted();
    } catch (e) {
      setError(e);
    }
  }

  register(User user) async {
    setLoading();
    try {
      await _userService.registerUser(user);
      setCompleted();
      setShowDialog('Registration Successful. Verify your email and login.');
    } catch (e) {
      setError(e);
    }
  }

  navigateLogin() => _navigationService.goBack();

  navigateClubSelect() => _navigationService.replace(RoutePaths.SELECT_CLUB);
}
