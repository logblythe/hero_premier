import 'package:hero_premier/core/models/login/login_model.dart';
import 'package:hero_premier/core/services/api_helper.dart';

class UserService {
  final ApiBaseHelper _api;

  UserService({ApiBaseHelper api}) : _api = api;

  login(postParams) {
    var response=_api.post("user/localLogin", postParams);
  }
}
