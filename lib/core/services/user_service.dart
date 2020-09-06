import 'dart:convert';

import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/helpers/shared_pref_helper.dart';
import 'package:hero_premier/core/models/club/club.dart';
import 'package:hero_premier/core/models/club/clubs_response.dart';
import 'package:hero_premier/core/models/image_upload.dart';
import 'package:hero_premier/core/models/individual_detail.dart';
import 'package:hero_premier/core/models/login/facebook_response.dart';
import 'package:hero_premier/core/models/login/login_model.dart';
import 'package:hero_premier/core/models/rank/rank_response.dart';
import 'package:hero_premier/core/models/user.dart';

class UserService {
  final ApiBaseHelper _api;
  final SharedPrefHelper _prefHelper;

  UserService({ApiBaseHelper api, SharedPrefHelper prefHelper})
      : _api = api,
        _prefHelper = prefHelper;

  List<Club> _clubs;
  LoginModel _loginModel;
  User _user = User();
  ImageUpload _upload;
  String _imageUrl;

  get clubs => _clubs;

  get loginModel => _loginModel;

  get imageUrl => _imageUrl;

  User get user => _user;

  checkUniqueMail(email) =>
      _api.post("/user/checkUniqueEmail", params: {"email": email});

  registerUser(user) => _api.post("/user/localSignup", params: user.toJson());

  login(params) => _api.post("/user/localLogin", params: params).then((value) {
        _loginModel = LoginModel.fromJson(value);
        _prefHelper.setString(KEY_TOKEN, loginModel.token);
        _prefHelper.setString(KEY_LOGIN, jsonEncode(loginModel.toJson()));
        _prefHelper.setBool(KEY_SESSION, true);
        _prefHelper.setString(
            KEY_USER, jsonEncode(loginModel.result.local.toJson()));
        _prefHelper.setString(KEY_USER_ID, loginModel.result.id);
      });

  fbLogin(token) {
    _api
        .get(null,
            wholeUrl:
                "https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=" +
                    token)
        .then((value) {
      FacebookResponse facebookResponse = FacebookResponse.fromJsonMap(value);
      _api.post("/user/facebookLogin", params: {
        "name": facebookResponse.name,
        "email": facebookResponse.email,
        "image": facebookResponse.picture.data.url,
        "facebookId": facebookResponse.id,
      }).then((value) {
        LoginModel loginModel = LoginModel.fromJson(value);

        _prefHelper.setString(KEY_TOKEN, loginModel.token);
        _prefHelper.setString(KEY_LOGIN, jsonEncode(loginModel.toJson()));
        _prefHelper.setBool(KEY_SESSION, true);
        _prefHelper.setBool(KEY_SOCIAL, true);
        _prefHelper.setString(
            KEY_USER, jsonEncode(loginModel.result.facebook.toJson()));
        _prefHelper.setString(KEY_USER_ID, loginModel.result.id);
      });
    });
  }

  logout() => _api.post("/user/logout").then((value) {
        _prefHelper.clear();
      });

  sendEmailForgotPassword(params) =>
      _api.post("/user/forgotPassword", params: params);

  fetchClubs() => _api.get("/club/getList/1/20").then((result) {
        ClubsResponse clubsResponse = ClubsResponse.fromJsonMap(result);
        _clubs = clubsResponse.clubs;
      });

  updateProfile(params) =>
      _api.patch("/user/updateLocalUser", params: params);

  changePassword(params) => _api
      .patch("/user/changePassword", params: params)
      .then((value) => print("the response ${jsonEncode(value)}"));

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
        RankResponse rankResponse = RankResponse.fromJsonMap(value);
        _user.rank = rankResponse.rank[0].rank.toString();
      });

  uploadProfileImage(params) =>
      _api.multipart("/user/updateImage", params: params).then((value) {
        _upload = ImageUpload.fromJsonMap(value);
        _imageUrl = _upload.result;
      });
}
