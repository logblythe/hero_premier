import 'package:hero_premier/core/services/api_helper.dart';

class UserService {
  final ApiBaseHelper _api;

  UserService({ApiBaseHelper api}) : _api = api;

  login() => _api.get("login");
}
