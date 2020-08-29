import 'package:hero_premier/core/models/login/data.dart';

class Picture {
  Data data;

  Picture({this.data});

  Picture.fromJsonMap(Map<String, dynamic> map)
      : data = map['data'] == null ? null : Data.fromJsonMap(map['data']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data == null ? null : this.data.toJson();
    return data;
  }
}
