class Team {
  String code;
  String icon;
  String short;
  String crestUrl;
  int id;
  String name;

  Team.fromJsonMap(Map<String, dynamic> map)
      : code = map["CODE"],
        icon = map["ICON"],
        short = map["SHORT"],
        crestUrl = map["crestUrl"],
        id = map["id"],
        name = map["name"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CODE'] = code;
    data['ICON'] = icon;
    data['SHORT'] = short;
    data['crestUrl'] = crestUrl;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
