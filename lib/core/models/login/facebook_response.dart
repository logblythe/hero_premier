import 'package:hero_premier/core/models/login/picture.dart';

class FacebookResponse {
  String name;
  Picture picture;
  String email;
  String id;

  FacebookResponse({this.name, this.picture, this.email, this.id});

  FacebookResponse.fromJsonMap(Map<String, dynamic> map)
      : name = map['name'],
        picture =
            map['picture'] == null ? null : Picture.fromJsonMap(map['picture']),
        email = map['email'],
        id = map['id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['picture'] = picture == null ? null : picture.toJson();
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
