import 'package:hero_premier/core/models/login/facebook.dart';
import 'package:hero_premier/core/models/login/groupid.dart';
import 'package:hero_premier/core/models/login/local.dart';

class LoginResult {
  Local local;
  Facebook facebook;
  int points;
  int points2019;
  String role;
  String status;
  Object userfavclub;
  Object userdevicetoken;
  Object userip;
  String id;
  String createdAt;
  String loggedFrom;
  int __v;
  String modifiedAt;
  GroupId groupId;
  bool isGroupCreater;
  //FIXME not getting rank from api
  String rank;

  LoginResult.fromJsonMap(Map<String, dynamic> map)
      : local = map["local"] != null ? Local.fromJsonMap(map["local"]) : null,
        facebook = map["facebook"] != null
            ? Facebook.fromJsonMap(map["facebook"])
            : null,
        points = map["points"],
        points2019 = map["points2019"],
        role = map["role"],
        status = map["status"],
        userfavclub = map["userfavclub"],
        userdevicetoken = map["userdevicetoken"],
        userip = map["userip"],
        id = map["_id"],
        createdAt = map["createdAt"],
        loggedFrom = map["loggedFrom"],
        __v = map["__v"],
        modifiedAt = map["modifiedAt"],
        groupId = map["groupId"]!=null?GroupId.fromJsonMap(map["groupId"]):null,
        isGroupCreater = map["isGroupCreater"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['local'] = local == null ? null : local.toJson();
    data['points'] = points;
    data['points2019'] = points2019;
    data['role'] = role;
    data['status'] = status;
    data['userfavclub'] = userfavclub;
    data['userdevicetoken'] = userdevicetoken;
    data['userip'] = userip;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['loggedFrom'] = loggedFrom;
    data['__v'] = __v;
    data['modifiedAt'] = modifiedAt;
    data['groupId'] = groupId == null ? null : groupId.toJson();
    data['isGroupCreater'] = isGroupCreater;
    return data;
  }
}
