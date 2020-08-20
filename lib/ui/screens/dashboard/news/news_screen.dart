import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/news.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/screens/dashboard/news/widgets/news_card.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';

class NewsScreen extends StatelessWidget {
  final List<News> _newsList = [
    News(
      'Talking Tactics',
      "Promoted Clubs: Parker\'s Fulham can learn from past",
      "12 min ago",
      "110",
      AssetPaths.NEWS_1,
    ),
    News(
      'Fantasy Premier League',
      "FPL Promoted Picks: attacking leeds full back to shine",
      "12 min ago",
      "110",
      AssetPaths.NEWS_2,
    ),
    News(
      'Fantasy Premier League',
      "FPL Promoted Picks: Mitrovic the focal point of Fulham attack",
      "12 min ago",
      "110",
      AssetPaths.NEWS_3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: Colors.grey.withOpacity(0.05),
      child: SingleChildScrollView(
        child: Column(
          children: _newsList.asMap().entries.map(
            (entry) {
              int index = entry.key;
              News news = entry.value;
              return NewsCard(
                index: index,
                news: news,
                onPress: () => _handleNewsSelect(context, index, news),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  _handleNewsSelect(BuildContext context, int index, News news) {
    Navigator.of(context)
        .pushNamed(RoutePaths.NEWS_DETAILS, arguments: [index, news]);
  }
}
