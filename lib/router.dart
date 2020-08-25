import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/news.dart';
import 'package:hero_premier/ui/screens/club/club_select_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/full_table_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/news/news_detail_screen.dart';
import 'package:hero_premier/ui/screens/forgotpassword/forgot_password.dart';
import 'package:hero_premier/ui/screens/home_screen.dart';
import 'package:hero_premier/ui/screens/login_screen.dart';
import 'package:hero_premier/ui/screens/register/register_screen.dart';
import 'package:hero_premier/ui/screens/settings/change_password.dart';
import 'package:hero_premier/ui/screens/settings/create_group.dart';
import 'package:hero_premier/ui/screens/settings/profile_screen.dart';
import 'package:hero_premier/ui/screens/settings/settings_screen.dart';
import 'package:hero_premier/ui/screens/winner/winner_details_screen.dart';

class RoutePaths {
  static const String LOGIN = "/login";
  static const String HOME = "/home";
  static const String REGISTER = "/register";
  static const String SELECT_CLUB = "/select-club";
  static const String DASHBOARD = "/dashboard";
  static const String WINNER_DETAIL = "/winner-detail";
  static const String PROFILE = "/profile";
  static const String FULL_TABLE = "/full-table";
  static const String NEWS_DETAILS = "/news-details";
  static const String FORGOT_PASSWORD="/forgot-password";
  static const String SETTING="/setting";
  static const String CHANGE_PASSWORD="/change-password";
  static const String CREATE_GROUP="/create-group";

}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutePaths.REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RoutePaths.FORGOT_PASSWORD:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RoutePaths.SELECT_CLUB:
        return MaterialPageRoute(builder: (_) => ClubSelectScreen());
      case RoutePaths.HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePaths.WINNER_DETAIL:
        return MaterialPageRoute(builder: (_) => WinnerDetailsScreen());
      case RoutePaths.PROFILE:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RoutePaths.FULL_TABLE:
        return MaterialPageRoute(builder: (_) => FullTableScreen());
      case RoutePaths.SETTING:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case RoutePaths.CHANGE_PASSWORD:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case RoutePaths.CREATE_GROUP:
        return MaterialPageRoute(builder: (_) => CreateGroup());
      case RoutePaths.NEWS_DETAILS:
        {
          var arguments = settings.arguments as List;
          int index = arguments[0];
          News news = arguments[1];
          return MaterialPageRoute(
            builder: (_) => NewsDetails(
              index: index,
              news: news,
            ),
          );
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
