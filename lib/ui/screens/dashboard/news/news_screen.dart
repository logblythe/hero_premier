import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/news/news.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/dashboard/news/widgets/news_card.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  final int showCount;

  const NewsScreen({Key key, this.showCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
        model: DashboardViewModel(
          dashboardService: Provider.of(context),
          navigationService: Provider.of(context),
          userService: Provider.of(context),
        ),
        onModelReady: (model) {
          model.fetchNews();
        },
        builder: (context, model, child) {
          if (model.loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<News> _newsList;
            if (showCount != null) {
              _newsList = model.newsList.sublist(0, showCount);
            } else {
              _newsList = model.newsList;
            }
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
                        onPress: () => model.selectNews(index),
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          }
        });
  }
}
