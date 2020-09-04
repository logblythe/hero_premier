import 'package:hero_premier/core/models/news/content.dart';
import 'package:hero_premier/core/models/news/embedded.dart';
import 'package:hero_premier/core/models/news/excerpt.dart';
import 'package:hero_premier/core/models/news/title.dart';

class News {
  int index;
  String date;
  Title title;
  Content content;
  Excerpt excerpt;
  Embedded embedded;

  News.fromJsonMap(Map<String, dynamic> map)
      : date = map["date"],
        title = Title.fromJsonMap(map["title"]),
        content = Content.fromJsonMap(map["content"]),
        excerpt = Excerpt.fromJsonMap(map["excerpt"]),
        embedded = Embedded.fromJsonMap(map["_embedded"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['title'] = title == null ? null : title.toJson();
    data['content'] = content == null ? null : content.toJson();
    data['excerpt'] = excerpt == null ? null : excerpt.toJson();
    return data;
  }
}
