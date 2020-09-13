import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/dashboard/dashboard_screen.dart';
import 'package:hero_premier/ui/screens/history/history_screen.dart';
import 'package:hero_premier/ui/screens/leaderboard/leaderboard_screen.dart';
import 'package:hero_premier/ui/screens/settings/settings_screen.dart';
import 'package:hero_premier/ui/screens/winner/winner_screen.dart';
import 'package:hero_premier/ui/widgets/custom_appbar.dart';
import 'package:hero_premier/ui/widgets/custom_bottom_navbar.dart';

import '../../router.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItem = 0;
  Widget _selectWidget = DashboardScreen();
  String title = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedItem != 0
          ? CustomAppBar.getAppBarGeneral(title)
          : CustomAppBar.getAppBar(
              "Premier Hero",
              onSearchPress: _handleSearch,
              onNotificationPress: _handleNotificationPress,
            ),
      body: _selectWidget != null ? _selectWidget : Container(),
      bottomNavigationBar: CustomBottomNavBar(
        labelList: ["HOME", "HISTORY", "WINNER", "RANKING", "SETTING"],
        iconList: [
          "assets/images/ic_football_regular.svg",
          "assets/images/ic_history.svg",
          "assets/images/ic_trophy.svg",
          "assets/images/ic_rank.svg",
          "assets/images/ic_setting.svg"
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
            if (_selectedItem == 1) {
              title = "History";
              _selectWidget = HistoryScreen();
            }
            if (_selectedItem == 4) {
              title = "Setting";
              _selectWidget = SettingsScreen();
            }

            if (_selectedItem == 0) {
              title = "DashBoard";
              _selectWidget = DashboardScreen();
            }
            if (_selectedItem == 2) {
              title = "Winner";
              _selectWidget = WinnerScreen();
            }
            if (_selectedItem == 3) {
              title = "Leaderboard";
              _selectWidget = LeaderboardScreen();
            }
          });
        },
        defaultSelectedIndex: 0,
      ),
    );
  }

  _handleSearch() {}

  _handleNotificationPress() {
    Navigator.of(context).pushReplacementNamed(RoutePaths.NOTIFICATION);
  }
}
