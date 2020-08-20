import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/news.dart';
import 'package:hero_premier/ui/screens/dashboard/news/widgets/source_author.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class NewsDetails extends StatelessWidget {
  final News news;
  final int index;

  const NewsDetails({Key key, this.news, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: 'hero_$index',
                child: Image.asset(
                  news.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.black.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(34, 0, 104, 16),
                  child: Text(
                    "${news.title}",
                    style: TextStyles.Subtitle1.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(32, 28, 42, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SourceAuthor(
                      showAuthor: true,
                      source: news.source,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 32),
                      width: 32,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text(
                      'Adrian Clarke says Cottagers must bring with them to the Premier League the defensive structure that served them so well last season',
                      style: TextStyles.Subtitle1.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 80),
                    Text(
                      'Scott Parker guided Fulham back to the Premier League by implementing a conservative, possession-based style that helps them control matches. The Cottagers are more resolute than when they were relegated from the top flight with the worst defensive record in 2018/19, conceding 81 goals.',
                      style: TextStyles.Body.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 80),
                    Text(
                      'Scott Parker guided Fulham back to the Premier League by implementing a conservative, possession-based style that helps them control matches. The Cottagers are more resolute than when they were relegated from the top flight with the worst defensive record in 2018/19, conceding 81 goals.',
                      style: TextStyles.Body.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
