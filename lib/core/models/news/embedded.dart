import 'package:hero_premier/core/models/news/author.dart';
import 'package:hero_premier/core/models/news/wp_featuredmedia.dart';

class Embedded {
  List<Author> author;
  List<FeaturedMedia> featureMedia;

  Embedded.fromJsonMap(Map<String, dynamic> map)
      : author = List<Author>.from(
          map["author"].map(
            (it) => Author.fromJsonMap(it),
          ),
        ),
        featureMedia = List<FeaturedMedia>.from(
          map["wp:featuredmedia"].map(
            (it) => FeaturedMedia.fromJsonMap(it),
          ),
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] =
        author != null ? this.author.map((v) => v.toJson()).toList() : null;
    data['wp:featuredmedia'] = featureMedia != null
        ? this.featureMedia.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
