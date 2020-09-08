import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/news/fabclubnews.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/table_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/news/news_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/prediction_result_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/widget/favclubnews_widget.dart';
import 'package:hero_premier/ui/screens/dashboard/widget/gift_section_widget.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.05),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewsScreen(showCount: 2),
            TableScreen(),
            SizedBox(height: 82),
            PredictionResultScreen(
              insideScrollView: true,
            ),
            GiftSectionWidget(),
            FavouriteClubNewsWidget(
              favclubNews: getFavClubNews(),
              favIconUrl: "assets/images/ic_arsenal.svg",
              favClubName: "Arsenal",
            ),
          ],
        ),
      ),
    );
  }

  List<FavouriteClubNews> getFavClubNews() {
    List<FavouriteClubNews> favouriteClubNews = List();
    favouriteClubNews.add(FavouriteClubNews(
        "Get your 20/21 Cup Final Celebration Shirt!", "10 Aug 2020"));
    favouriteClubNews.add(FavouriteClubNews(
        "Zech Medley joins Gillingham on loan", "11 Aug 2020"));
    return favouriteClubNews;
  }
}
