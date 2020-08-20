import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/screens/leaderboard/widgets/rank_card.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            getWinnerWidgetMain(),
            SizedBox(
              height: 8.0,
            ),
            RankCard(
              name: "Suman Sapkot",
              pos: "4th",
              points: "940",
              url: "assets/images/ic_person_1.png",
            ),
            RankCard(
              name: "Sandeep Chhetri",
              pos: "5th",
              points: "870",
              url: "assets/images/ic_person_2.png",
            ),
            RankCard(
              name: "Roman Shahi",
              pos: "6th",
              points: "772",
              url: "assets/images/ic_person.png",
            ),
            RankCard(
              name: "Sudip Pathak",
              pos: "7th",
              points: "718",
              url: "assets/images/ic_person_3.png",
            ),
            RankCard(
              name: "Naresh Lamgade",
              pos: "8th",
              points: "701",
              url: "assets/images/ic_person_4.png",
            ),
            RankCard(
              name: "Aarab Mishra",
              pos: "9th",
              points: "540",
              url: "assets/images/ic_person_5.png",
            ),
            RankCard(
              name: "Ramesh Thakuri",
              pos: "45th",
              points: "165",
              url: "assets/images/ic_person.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget getWinnerWidget() {
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
                child: Image.asset(
                  "assets/images/ic_profile_1.png",
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

  Widget getWinnerWidgetMain() {
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
                    getWinnerWidget(),
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
            "Sharmila Thapa",
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
                style: TextStyles.TitleTextNormalStyle,
              ),
              Text(
                "2589",
                style: TextStyles.TitleTextNormalBoldStyle,
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          getSecondThirdWidget(),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget getSecondThirdWidget() {
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
                      child: getSecondWidget(),
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
                "Nirajan Baral",
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
                    style: TextStyles.TitleTextNormalStyle,
                  ),
                  Text(
                    "1401",
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
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
                    child: getThirdWidget(),
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
                "Rajani Suwal",
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
                    style: TextStyles.TitleTextNormalStyle,
                  ),
                  Text(
                    "1052",
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getSecondWidget() {
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
                child: Image.asset(
                  "assets/images/ic_profile_2.png",
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

  Widget getThirdWidget() {
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
                child: Image.asset(
                  "assets/images/ic_profile_3.png",
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
