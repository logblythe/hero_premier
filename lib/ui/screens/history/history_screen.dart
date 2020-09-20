import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/history/history_result.dart';
import 'package:hero_premier/core/view_models/history_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_card.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_default_widget.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:hero_premier/ui/widgets/paginating_card.dart';
import 'package:hero_premier/utils/api_response.dart';
import 'package:hero_premier/utils/constants.dart';
import 'package:provider/provider.dart';

//design fixes
class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with TickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HistoryViewModel>(
      model: HistoryViewModel(
        historyService: Provider.of(context),
        userService: Provider.of(context),
        winnerService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.fetchHistory();
        _controller.addListener(() {
          if (_controller.position.pixels ==
              _controller.position.maxScrollExtent) {
            model.fetchHistoryMore();
          }
        });
      },
      builder: (context, model, child) {
        if (model.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (model.error != null) {
          return ErrorCard(error: model.error);
        } else {
          return body(model);
        }
      },
    );
  }

  Widget body(HistoryViewModel model) {
    Map<String, List<HistoryResult>> _gameWeekMap = model.gameWeekMap;
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
                [
                  currentSeasonHistory(_gameWeekMap, model),
                  currentSeasonHistory(_gameWeekMap, model),
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
        Tab(text: "Current Season"),
        Tab(text: "2019/2020")
        //TODO REMOVED AS PER FEEDBACK
        // Tab(text: "2020/2019"),
        // Tab(text: "2019/2018"),
        // Tab(text: "Reward"),
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

  Widget currentSeasonHistory(gameWeekMap, model) {
    return gameWeekMap.length == 0
        ? HistoryDefaultWidget(type: EmptyList.HISTORY)
        : ListView.builder(
            controller: _controller,
            itemCount: gameWeekMap.length,
            itemBuilder: (context, index) {
              String gameWeek = gameWeekMap.keys.elementAt(index).split(" ")[1];
              List<HistoryResult> histories =
                  gameWeekMap.values.elementAt(index);
              int totalObtainedScore = 0;
              histories.forEach((element) {
                totalObtainedScore = element.obtainedScore + totalObtainedScore;
              });
              return Column(
                children: [
                  HistoryCard(
                    gameWeek: gameWeek,
                    historyResult: histories,
                    totalObtainedScore: totalObtainedScore,
                  ),
                  (index == gameWeekMap.length - 1 &&
                          model.status == Status.PAGINATING)
                      ? PaginatingCard()
                      : Container()
                ],
              );
            },
          );
  }
}
