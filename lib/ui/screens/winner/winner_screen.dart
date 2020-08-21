import 'package:flutter/material.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/screens/winner/widgets/winner_card.dart';

class WinnerScreen extends StatefulWidget {
  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getTabBar(),
          Expanded(
            child: Container(
              color: Theme.of(context).backgroundColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _getTabBarView(
                <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          WinnerCard(
                            name: "Suman Sapkota",
                            week: "38",
                            weekPoint: "60",
                            totalPoints: "9100",
                            url: "assets/images/ic_person_1.png",
                            onTap: _handlePress,
                          ),
                          WinnerCard(
                            name: "Sunil Mahat",
                            week: "37",
                            weekPoint: "60",
                            totalPoints: "120",
                            url: "assets/images/ic_person_2.png",
                            onTap: _handlePress,
                          ),
                          WinnerCard(
                            name: "Waiba Kaier",
                            week: "36",
                            weekPoint: "60",
                            totalPoints: "300",
                            url: "assets/images/ic_person_3.png",
                            onTap: _handlePress,
                          ),
                          WinnerCard(
                            name: "Moshafir Hon",
                            week: "35",
                            weekPoint: "60",
                            totalPoints: "125",
                            url: "assets/images/ic_person_4.png",
                            onTap: _handlePress,
                          ),
                          WinnerCard(
                            name: "Kaeiren Maie",
                            week: "34",
                            weekPoint: "60",
                            totalPoints: "20",
                            url: "assets/images/ic_person_5.png",
                            onTap: _handlePress,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.settings),
                  Icon(Icons.settings),
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
      labelColor: ColorPrimary,
      indicatorColor: ColorPrimary,
      indicatorWeight: 2.0,
      unselectedLabelColor: Color(0xFF9EA6C9),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      tabs: <Widget>[
        Tab(
          text: "Weekly",
        ),
        Tab(
          text: "2020/2019",
        ),
        Tab(
          text: "2019/2018",
        ),
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

  _handlePress() {
    Navigator.of(context).pushNamed(RoutePaths.WINNER_DETAIL);
  }
}
