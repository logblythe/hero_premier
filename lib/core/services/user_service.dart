import 'dart:convert';

import 'package:hero_premier/core/helpers/api_helper.dart';
import 'package:hero_premier/core/helpers/secured_storage_helper.dart';
import 'package:hero_premier/core/models/club/club.dart';
import 'package:hero_premier/core/models/club/clubs_response.dart';
import 'package:hero_premier/core/models/image_upload.dart';
import 'package:hero_premier/core/models/individual_detail.dart';
import 'package:hero_premier/core/models/login/facebook_response.dart';
import 'package:hero_premier/core/models/login/login_model.dart';
import 'package:hero_premier/core/models/rank/rank_response.dart';

class UserService {
  final ApiBaseHelper _api;
  final SecuredStorageHelper _storageHelper;

  UserService({ApiBaseHelper api, SecuredStorageHelper storageHelper})
      : _api = api,
        _storageHelper = storageHelper;

  IndividualDetail _individualDetail;
  ImageUpload _upload;
  List<Club> _clubs;
  LoginModel _loginModel;
  RankResponse _rankResponse;
  String _imageUrl;

  List<Club> get clubs => _clubs;

  LoginModel get loginModel => _loginModel;

  RankResponse get rankResponse => _rankResponse;

  IndividualDetail get individualDetail => _individualDetail;

  String get imageUrl => _imageUrl;

  String get userId => loginModel?.result?.id ?? "5d45bc0e6f24b26dc40bd462";

  storedCredentials() => _storageHelper.allValues();

  changePassword(params) => _api
      .patch("/user/changePassword", params: params)
      .then((value) => print("the response ${jsonEncode(value)}"));

  checkUniqueMail(email) =>
      _api.post("/user/checkUniqueEmail", params: {"email": email});

  fetchClubs() => _api.get("/club/getList/1/20").then((result) {
        ClubsResponse clubsResponse = ClubsResponse.fromJsonMap(result);
        _clubs = clubsResponse.clubs;
      });

  fetchUserDetails(String userId) =>
      _api.get("/user/getSingleUserDetails/$userId").then((value) {
        _individualDetail = IndividualDetail.fromJsonMap(value);
      });

  fetchUserRank(String userId) =>
      _api.get("/user/individualRank/$userId").then((value) {
        _rankResponse = RankResponse.fromJsonMap(value);
      });

  login(params) => _api.post("/user/localLogin", params: params).then(
        (value) {
          _loginModel = LoginModel.fromJson(value);
          _storageHelper.set(key: KEY_EMAIL, value: params['email']);
          _storageHelper.set(key: KEY_PASSWORD, value: params['password']);
          _storageHelper.set(key: KEY_TOKEN, value: _loginModel.token);
        },
      );

  loginFb(token) {
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
        _loginModel = LoginModel.fromJson(value);
        _storageHelper.set(key: KEY_FB_TOKEN, value: token);
      });
    });
  }

  logout() => _api.post("/user/logout").then((value) {
        _storageHelper.deleteAll();
      });

  registerUser(user) => _api.post("/user/localSignup", params: user.toJson());

  sendEmailForgotPassword(params) =>
      _api.post("/user/forgotPassword", params: params);

  updateProfile(params) => _api.patch("/user/updateLocalUser", params: params);

  uploadProfileImage(params) =>
      _api.multipart("/user/updateImage", params: params).then((value) {
        _upload = ImageUpload.fromJsonMap(value);
        _imageUrl = _upload.result;
      });
}
