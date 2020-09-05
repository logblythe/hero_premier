import 'package:hero_premier/core/models/news/media_details.dart';

class FeaturedMedia {
  MediaDetails mediaDetails;

  FeaturedMedia.fromJsonMap(Map<String, dynamic> map)
      : mediaDetails = MediaDetails.fromJsonMap(map["media_details"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_details'] = mediaDetails == null ? null : mediaDetails.toJson();
    return data;
  }
}
