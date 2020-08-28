import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/models/leaderboard/leaderboard.dart';
import 'package:hero_premier/core/view_models/leaderboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/leaderboard/widgets/rank_card.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:provider/provider.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LeaderboardViewModel>(
      model: LeaderboardViewModel(
        leaderboardService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.fetchLeaderboard();
      },
      builder: (context, model, child) {
        if (model.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (model.error != null) {
          return ErrorCard(
            error: model.error,
            onPress: model.fetchLeaderboard,
          );
        } else {
          List<Leaderboard> _leaderboards = model.leaderboards;
          List<Leaderboard> _top3 = _leaderboards.sublist(0, 3);
          List<Leaderboard> _rest = _leaderboards.sublist(3);
          return Container(
            margin: EdgeInsets.all(16.0),
            child: ListView(
                children: [getWinnerWidgetMain(_top3)]..addAll(
                    _rest.asMap().entries.map(
                      (entry) {
                        int index = entry.key;
                        var leaderboard = entry.value;
                        return RankCard(
                          name: leaderboard.local.name,
                          pos: '${index + 4} th',
                          points: leaderboard.points.toString(),
                          url: leaderboard.local.image,
                        );
                      },
                    ).toList(),
                  )),
          );
        }
      },
    );
  }

  Widget getWinnerWidget(imageUrl) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 75,
        height: 75,
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.only(top: 8.0),
        decoration:
            BoxDecoration(color: Color(0xFFFFB408), shape: BoxShape.circle),
        child: Container(
          width: 75,
          height: 75,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Stack(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  imageUrl:imageUrl,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWinnerWidgetMain(List<Leaderboard> top3) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                margin: EdgeInsets.only(bottom: 16.0, top: 24.0),
                child: Stack(
                  children: [
                    getWinnerWidget(top3[0].local.image),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: EdgeInsets.only(top: 24.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1.0,
                                    offset: Offset(0, 0.5),
                                    spreadRadius: 0.5)
                              ]),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 6.0),
                            child: SvgPicture.asset(
                              "assets/images/ic_medal_first.svg",
                              width: 15.0,
                              height: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20.0, bottom: 8.0),
                            child: SvgPicture.asset(
                                "assets/images/ic_left_corn.svg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, bottom: 8.0),
                            child: SvgPicture.asset(
                                "assets/images/ic_right_corn.svg"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            top3[0].local.name,
            style: TextStyles.TitleTextNormalBoldStyle,
          ),
          SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Points ",
                style: TextStyles.Body.copyWith(
                    color: Theme.of(context).hintColor),
              ),
              Text(
                top3[0].points.toString(),
                style: TextStyles.TitleTextNormalBoldStyle,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          getSecondThirdWidget(top3),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget getSecondThirdWidget(List<Leaderboard> top3) {
    return Container(
      margin: EdgeInsets.only(left: 48.0, right: 48.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: getSecondWidget(top3[1].local.image),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1.0,
                                offset: Offset(0, 0.5),
                                spreadRadius: 0.5)
                          ]),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: SvgPicture.asset(
                          "assets/images/ic_medal_second.svg",
                          width: 15.0,
                          height: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                top3[1].local.name,
                style: TextStyles.TitleTextNormalBoldStyle,
              ),
              SizedBox(height: 4.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Points ",
                    style: TextStyles.Body.copyWith(
                        color: Theme.of(context).hintColor),
                  ),
                  Text(
                    top3[1].points.toString(),
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                ],
              ),
              SizedBox(height: 8.0),
            ],
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: getThirdWidget(top3[2].local.image),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 1.0,
                                  offset: Offset(0, 0.5),
                                  spreadRadius: 0.5)
                            ]),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 6.0),
                          child: SvgPicture.asset(
                            "assets/images/ic_medal_third.svg",
                            width: 15.0,
                            height: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                top3[2].local.name,
                style: TextStyles.TitleTextNormalBoldStyle,
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Points ",
                    style: TextStyles.Body.copyWith(
                        color: Theme.of(context).hintColor),
                  ),
                  Text(
                    top3[2].points.toString(),
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                ],
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget getSecondWidget(imageUrl) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 75,
        height: 75,
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.only(top: 8.0),
        decoration:
            BoxDecoration(color: Color(0xFFC5E1E6), shape: BoxShape.circle),
        child: Container(
          width: 75,
          height: 75,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Stack(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  imageUrl: imageUrl,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getThirdWidget(imageUrl) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 75,
        height: 75,
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.only(top: 8.0),
        decoration:
            BoxDecoration(color: Color(0xFFB28A30), shape: BoxShape.circle),
        child: Container(
          width: 75,
          height: 75,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Stack(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  imageUrl: imageUrl,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
