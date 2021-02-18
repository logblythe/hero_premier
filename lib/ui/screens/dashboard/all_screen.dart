import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/news/favClubnews.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/table_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/news/news_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/predict_win_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/widget/gift_section_widget.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.05),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PredictWinScreen(),
            NewsScreen(showCount: 2),
            TableScreen(),
            GiftSectionWidget(),
           //TODO: REMOVED PER FEEDBACK
           /* FavouriteClubNewsWidget(
              favClubNews: getFavClubNews(),
              favIconUrl: "assets/images/ic_arsenal.svg",
              favClubName: "Arsenal",
            ),*/
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
