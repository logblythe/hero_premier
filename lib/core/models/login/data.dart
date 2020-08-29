class Data {
  int height;
  int width;
  bool isSilhouette;
  String url;

  Data({this.height, this.width, this.isSilhouette, this.url});

  Data.fromJsonMap(Map<String, dynamic> map)
      : height = map["height"],
        width = map["width"],
        isSilhouette = map['is_silhouette'],
        url = map["url"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data["height"] = height;
    data["width"] = width;
    data['is_silhouette'] = this.isSilhouette;
    data["url"] = url;
    return data;
  }
}
