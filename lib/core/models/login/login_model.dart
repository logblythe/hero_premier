import 'package:hero_premier/core/models/login/result.dart';

class LoginModel {
  Result result;
  String message;
  String token;

  LoginModel({this.result, this.message, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
