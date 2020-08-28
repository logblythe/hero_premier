import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/core/view_models/profile_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/history/history_screen.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class WinnerDetailsScreen extends StatefulWidget {
  @override
  _WinnerDetailsScreenState createState() => _WinnerDetailsScreenState();
}

class _WinnerDetailsScreenState extends State<WinnerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              getHeaderWidget(),
              Expanded(child: HistoryScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeaderWidget() {
    return BaseWidget<ProfileViewModel>(
      model: ProfileViewModel(
          navigationService: Provider.of(context),
          userService: Provider.of(context)),
      onModelReady: (model) {
        model.fetchUserDetails();
      },
      builder: (context, model, child) {
        if (model.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (model.error != null) {
          return Text(model.error);
        }
        {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: model.user.image,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          height: 90,
                          width: 90,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        model.user.name,
                        style: TextStyles.TitleTextNormalBoldStyle,
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Ranking",
                              style: TextStyle(
                                  color: Color(0xFF9EA6C9).withOpacity(0.56),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              getRank(model.user.rank),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 16.0, right: 16.0),
                          height: 16.0,
                          width: 1.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF9EA6C9),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Total point",
                              style: TextStyle(
                                  color: Color(0xFF9EA6C9).withOpacity(0.56),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              model.user.points,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: BackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            "assets/images/ic_pattern.svg",
                            width: MediaQuery.of(context).size.width,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 32.0,
                                  ),
                                  Text(
                                    "Arsenal",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 4.0),
                                  SvgPicture.asset(
                                    'assets/images/ic_liverpool.svg',
                                    width: 26.0,
                                    height: 26.0,
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 32.0),
                                child: Text(
                                  "Her favourite club",
                                  style: TextStyle(
                                    color: Color(0xFF9EA6C9),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  String getRank(String rank) {
    if (rank != null) {
      int _rank = int.parse(rank);
      var _suffixedRank;
      switch (_rank) {
        case 1:
          _suffixedRank = "1st";
          break;
        case 2:
          _suffixedRank = "2nd";
          break;
        case 3:
          _suffixedRank = "3rd";
          break;
        default:
          _suffixedRank = "${rank}th";
          break;
      }
      return _suffixedRank;
    } else {
      return "N/A";
    }
  }
}
