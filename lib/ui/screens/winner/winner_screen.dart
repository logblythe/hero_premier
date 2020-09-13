import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/winner_result.dart';
import 'package:hero_premier/core/view_models/winner_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/leaderboard/widgets/reward_card.dart';
import 'package:hero_premier/ui/screens/winner/widgets/winner_card.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:provider/provider.dart';

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
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<WinnerViewModel>(
      model: WinnerViewModel(
        winnerService: Provider.of(context),
        navigationService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.fetchWinners();
      },
      builder: (ctx, model, child) {
        if (model.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (model.error != null) {
          return ErrorCard(
            error: model.error,
            onPress: model.fetchWinners(),
          );
        } else {
          List<WinnerResult> winners = model.winners;
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
                        currentSeasonWinners(winners, model),
                        //TODO REMOVED AS PER FEEDBACK
                        // Icon(Icons.settings),
                        // Icon(Icons.settings),
                        // rewardWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
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
        Tab(text: "Weekly"),
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

  Widget currentSeasonWinners(List<WinnerResult> winners, model) {
    return ListView(
      children: winners.map((winner) {
        return WinnerCard(
          name: winner.weekInfo.winnerInfo.local.name,
          week: winner.weekInfo.id.substring(winner.weekInfo.id.length - 1),
          totalPoints: winner.weekInfo.winnerInfo.points.toString(),
          weekPoint: winner.obtainedScore.toString(),
          url: winner.weekInfo.winnerInfo.local.image,
          onTap: () => model.selectWinner(winner.weekInfo.winnerInfo.id),
        );
      }).toList(),
    );
  }

  Widget rewardWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          RewardCardWidget(
            position: "1st",
            backgroundColor: Color(0xFFFFDE46),
            backgroundImgUrl: AssetPaths.IC_BACKGROUND_REWARD,
            icon: AssetPaths.IC_FIRST_MEDAL,
            title: "50K Cash prize for the winner",
            descripion:
                "Hello, winner first of leaderboard get 50,000 cash in hand gift",
            fontColor: Color(0xFF121212),
            buttonColor: Color(0xFFCEB648),
          ),
          RewardCardWidget(
            position: "2nd",
            backgroundColor: Color(0xFF75C5F2),
            backgroundImgUrl: AssetPaths.IC_BACKGROUND_REWARD,
            icon: AssetPaths.IC_SECOND_MEDAL,
            title: "30K Cash prize for the winner",
            descripion:
                "Hello, winner first of leaderboard get 30,000 cash in hand gift",
            fontColor: Color(0xFF121212),
            buttonColor: Color(0xFFA7D2D7),
          ),
          RewardCardWidget(
            position: "3rd",
            backgroundColor: Color(0xFFAC862F),
            backgroundImgUrl: AssetPaths.IC_BACKGROUND_REWARD,
            icon: AssetPaths.IC_THIRD_MEDAL,
            title: "20K Cash prize for the winner",
            descripion:
                "Hello, winner first of leaderboard get 20,000 cash in hand gift",
            fontColor: Color(0xFFFFFFFF),
            buttonColor: Color(0xFFC9A85C),
          )
        ],
      ),
    );
  }
}
