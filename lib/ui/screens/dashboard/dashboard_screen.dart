import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/dashboard/all_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/gift/gift.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/table_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/news/news_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/predict_win_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/prediction_result_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getTabBar(),
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.05),
              width: MediaQuery.of(context).size.width,
              child: _getTabBarView(
                <Widget>[
                  AllScreen(),
                  PredictWinScreen(),
                  NewsScreen(),
                  PredictionResultScreen(),
                  TableScreen(),
                  GiftScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TabBar _getTabBar() {
    return TabBar(
      isScrollable: true,
      labelColor: Theme.of(context).primaryColor,
      indicatorColor: Theme.of(context).primaryColor,
      indicatorWeight: 2.0,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 5.0),
          insets: EdgeInsets.symmetric(horizontal: 16.0)),
      unselectedLabelColor: Color(0xFF9EA6C9),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      tabs: <Widget>[
        Tab(text: "All"),
        Tab(text: "Predict & win"),
        Tab(text: "News"),
        Tab(text: "Results"),
        Tab(text: "Tables"),
        Tab(text: "Gift"),
      ],
      controller: _tabController,
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: _tabController,
    );
  }
}
