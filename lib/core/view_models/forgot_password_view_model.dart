import 'package:flutter/cupertino.dart';
import 'package:hero_premier/core/services/navigation_service.dart';
import 'package:hero_premier/core/services/user_service.dart';
import 'package:hero_premier/core/view_models/base_view_model.dart';

import '../../router.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  UserService _userService;
  NavigationService _navigationService;

  ForgotPasswordViewModel({
    @required NavigationService navigationService,
    @required UserService userService,
  })  : this._navigationService = navigationService,
        this._userService = userService;


  sendEmailForgotPassword(String email) async{
    try{
      setLoading();
      var response=await _userService.sendEmailForgotPassword({"email":email});
      setDialogContent(response);
      setCompleted();
    }catch(e){
      setError(e.toJson());
    }
  }

  navigateHome() => _navigationService.replace(RoutePaths.LOGIN);
}
