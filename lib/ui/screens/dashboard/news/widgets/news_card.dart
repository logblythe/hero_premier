import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_premier/core/models/news/news.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final int index;
  final Function() onPress;

  NewsCard({Key key, this.news, this.onPress, this.index}) : super(key: key) {
    news.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        decoration: UIHelper.boxDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //todo hiding it as per feedback
           /* SourceAuthor(
              source: news.embedded.author[0].name,
              authorUrl: news.embedded.author[0].avatarUrls.ninetySix,
            ),
            SizedBox(height: 12),*/
            Text(news.title.rendered, style: TextStyles.Subtitle1),
            SizedBox(height: 8),
            //todo hiding it as per feedback
            /* Text(
              news.date,
              style: TextStyles.Subcaption.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            SizedBox(height: 8),*/
            Hero(
              tag: '${news.index}',
              child: CachedNetworkImage(
                imageUrl: news.embedded.featureMedia[0].mediaDetails.sizes
                    .medium.sourceUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.fill,
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                errorWidget: (context, url, error) {
                  return Image.asset(AssetPaths.LOGO);
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  //TODO: unused for now
  /*Row _buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetPaths.IC_GOAL,
              height: 24,
              width: 24,
            ),
            Text(
              "count",
              style:
                  TextStyles.Body.copyWith(color: Theme.of(context).hintColor),
            ),
          ],
        ),
        SvgPicture.asset(
          AssetPaths.IC_SHARE,
          height: 12,
          width: 14,
        ),
      ],
    );
  }*/
}
