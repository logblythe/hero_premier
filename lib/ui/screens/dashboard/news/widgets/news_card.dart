import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/models/news.dart';
import 'package:hero_premier/ui/screens/dashboard/news/widgets/source_author.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final int index;
  final Function() onPress;

  const NewsCard({Key key, this.news, this.onPress, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 0,
                spreadRadius: 0,
                offset: Offset(0, 0.01),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SourceAuthor(
              source: news.source,
            ),
            SizedBox(height: 12),
            Text(news.title, style: TextStyles.Subtitle1),
            SizedBox(height: 8),
            Text(
              news.time,
              style: TextStyles.Subcaption.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            SizedBox(height: 8),
            Hero(
              tag: 'hero_$index',
              child: Image.asset(
                news.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 16),
            Row(
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
                      news.count,
                      style: TextStyles.Body.copyWith(
                          color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  AssetPaths.IC_SHARE,
                  height: 12,
                  width: 14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
