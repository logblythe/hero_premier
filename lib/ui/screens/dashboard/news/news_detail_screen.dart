import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hero_premier/core/models/news/news.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseWidget<DashboardViewModel>(
        model: DashboardViewModel(
          dashboardService: Provider.of(context),
          navigationService: Provider.of(context),
          userService: Provider.of(context),
        ),
        onModelReady: (model) {
          model.fetchNews();
        },
        builder: (context, model, child) {
          News _news = model.selectedNews;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: '${_news.index}',
                      child: CachedNetworkImage(
                        imageUrl: _news.embedded.featureMedia[0].mediaDetails
                            .sizes.medium.sourceUrl,
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
                          "${_news.title.rendered}",
                          style: TextStyles.Subtitle1.copyWith(
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24,
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      padding: const EdgeInsets.fromLTRB(32, 28, 42, 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 32),
                            width: 32,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Theme.of(context).hintColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          //TODO: not sure if this is required
                          // Html(data: _news.excerpt.rendered),
                          // Text(
                          //   _news.excerpt.rendered,
                          //   style: TextStyles.Subtitle1.copyWith(
                          //       color: Theme.of(context).primaryColor),
                          // ),
                          // SizedBox(height: 80),
                          Html(data: _news.content.rendered),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
