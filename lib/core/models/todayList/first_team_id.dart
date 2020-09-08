class FirstTeamId {
  String id;
  String name;
  String image;

  FirstTeamId.fromJsonMap(Map<String, dynamic> map)
      : id = map["_id"],
        name = map["name"],
        image = map["image"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
