import 'package:hero_premier/core/models/login/groupid.dart';
import 'package:hero_premier/core/models/login/local.dart';
import 'package:hero_premier/core/models/login/facebook.dart';

class Result {
  Local local;
  Facebook facebook;
  String role;
  String status;
  String sId;
  String createdAt;
  String loggedFrom;
  int iV;
  GroupId groupId;
  bool isGroupCreater;

  Result({
      this.local,
      this.facebook,
      this.role,
      this.status,
      this.sId,
      this.createdAt,
      this.loggedFrom,
      this.iV,
      this.groupId,
      this.isGroupCreater});

  Result.fromJson(Map<String, dynamic> json) {
    local = json['local'] != null ? Local.fromJson(json['local']) : null;
    facebook = json['facebook'] != null
        ?  Facebook.fromJsonMap(json['facebook'])
        : null;
    role = json['role'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    loggedFrom = json['loggedFrom'];
    iV = json['__v'];
    groupId =
        json['groupId'] != null ? GroupId.fromJson(json['groupId']) : null;
    isGroupCreater = json['isGroupCreater'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    if (this.local != null) {
      data['local'] = this.local.toJson();
    }
    if (this.facebook != null) {
      data['facebook'] = this.facebook.toJson();
    }
    data['role'] = this.role;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['loggedFrom'] = this.loggedFrom;
    if (this.groupId != null) {
      data['groupId'] = this.groupId.toJson();
    }
    data['isGroupCreater'] = this.isGroupCreater;
    return data;
  }
}
