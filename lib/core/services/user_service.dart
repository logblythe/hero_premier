import 'dart:convert';

import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/helpers/shared_pref_helper.dart';
import 'package:hero_premier/core/models/club/club.dart';
import 'package:hero_premier/core/models/club/clubs_response.dart';
import 'package:hero_premier/core/models/individual_detail.dart';
import 'package:hero_premier/core/models/login/login_model.dart';
import 'package:hero_premier/core/models/rank.dart';
import 'package:hero_premier/core/models/user.dart';

//The related functionalities should be grouped into one service.
//Example: logout functionality is related to user
//so, deleted settings service and moved the logout functionality to user service

//One viewModel can have multiple services
class UserService {
  final ApiBaseHelper _api;
  final SharedPrefHelper _prefHelper;

  UserService({ApiBaseHelper api, SharedPrefHelper prefHelper})
      : _api = api,
        _prefHelper = prefHelper;

  List<Club> _clubs;

  get clubs => _clubs;

  LoginModel _loginModel;

  get loginModel => _loginModel;

  User _user = User();

  User get user => _user;

  checkUniqueMail(email) =>
      _api.post("/user/checkUniqueEmail", params: {"email": email});

  registerUser(user) => _api.post("/user/localSignup", params: user.toJson());

  login(params) => _api.post("/user/localLogin", params: params).then((value) {
        LoginModel loginModel = LoginModel.fromJson(value);
        _prefHelper.setString(KEY_TOKEN, loginModel.token);
        _prefHelper.setString(KEY_LOGIN, jsonEncode(loginModel.toJson()));
        _prefHelper.setBool(KEY_SESSION, true);
        _prefHelper.setString(
            KEY_USER, jsonEncode(loginModel.result.local.toJson()));
        _prefHelper.setString(KEY_USER_ID, loginModel.result.sId);
      });

  logout() => _api.post("/user/logout").then((value) {
        _prefHelper.clear();
      });

  sendEmailForgotPassword(params) =>
      _api.post("/user/forgotPassword", params: params);

  fetchClubs() => _api.get("/club/getList/1/20").then((result) {
        ClubsResponse clubsResponse = ClubsResponse.fromJsonMap(result);
        _clubs = clubsResponse.clubs;
      });

  updateProfile(params) => _api.post("/user/updateLocalUser", params: params);

  Future<User> getUserModel() async {
    final jsonResponse = json.decode(await _prefHelper.getString(KEY_USER));
    User user = User.fromJsonMap(jsonResponse);
    return user;
  }

  getUserId() async {
    return await _prefHelper.getString(KEY_USER_ID);
  }

  Future<bool> getSession() async {
    return await _prefHelper.getBool(KEY_SESSION);
  }

  fetchUserDetails(String userId) =>
      _api.get("/user/getSingleUserDetails/$userId").then((value) {
        IndividualDetail detail = IndividualDetail.fromJsonMap(value);
        _user.name = detail.result.local.name;
        _user.image = detail.result.local.image;
        _user.points = detail.result.points.toString();
      });

  fetchUserRank(String userId) =>
      _api.get("/user/individualRank/$userId").then((value) {
        Rank rank = Rank.fromJsonMap(value);
        _user.rank = rank.rank.toString();
      });
}
