import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/core/models/news/favClubnews.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';

class FavouriteClubNewsWidget extends StatelessWidget {
  final List<FavouriteClubNews> favClubNews;
  final String favIconUrl;
  final String favClubName;
  final Function press;

  FavouriteClubNewsWidget({
    Key key,
    this.favClubNews,
    this.favIconUrl,
    this.favClubName,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: UIHelper.boxDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 24.0),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                AssetPaths.IC_RIBBON,
                width: 34,
                height: 44,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Row(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: UIHelper.boxDecorationCircle(context),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        favIconUrl,
                        width: 38.0,
                        height: 38.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    favClubName,
                    style: TextStyles.Subtitle1,
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
          getNewsWidget(favClubNews, context),
          Center(
            child: InkWell(
              onTap: () => press ?? print('clicked'),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      "REDEEM",
                      style: TextStyles.Subtitle1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget getNewsWidget(
      List<FavouriteClubNews> favClubNews, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: favClubNews.asMap().entries.map(
        (entry) {
          // int index = entry.key;
          FavouriteClubNews news = entry.value;
          return Container(
            margin:
                EdgeInsets.only(left: 24.0, right: 12.0, top: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "News",
                  style: TextStyles.Subtitle2.copyWith(
                      color: Theme.of(context).accentColor),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  news.title,
                  style: TextStyles.Subtitle1,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  news.date,
                  style: TextStyles.Caption2.copyWith(color: Color(0xFF9EA6C9)),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
