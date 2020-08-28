import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/dead_line_timer.dart';

class PredictWinScreen extends StatefulWidget {
  @override
  _PredictWinScreenState createState() => _PredictWinScreenState();
}

class _PredictWinScreenState extends State<PredictWinScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              DeadlineTimer(),
              SizedBox(height: 16.0),
              getPredictWinWidget(),
              SizedBox(height: 24.0),
              Text(
                "Next Prediction",
                style: TextStyle(
                    color: Color(0xFF9EA6C9),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(height: 16.0),
              getNextItemPredictionWidget(
                  "36",
                  "assets/images/ic_liverpool.svg",
                  "assets/images/ic_arsenal.svg",
                  "Liverpool",
                  "Arsenal"),
              getNextItemPredictionWidget(
                  "35",
                  "assets/images/ic_chelsea.svg",
                  "assets/images/ic_manchester_city.svg",
                  "Chealse",
                  "Manchester City"),
            ],
          ),
        ),
      ),
    );
  }

  Widget getNextPredictionWidget() {
    return Container(
      padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.0,
            offset: Offset(0, 0.3),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  width: 2.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Next prediction deadline",
                  style: TextStyles.TitleTextNormalBoldStyle,
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 38.0,
                    height: 38.0,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF9EA6C9).withOpacity(0.15),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/ic_timer.svg",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "36",
                        style: TextStyle(
                            color: Color(0xFF37003D),
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Days",
                        style: TextStyle(
                            color: Color(0xFF9EA6C9),
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "21",
                              style: TextStyle(
                                  color: Color(0xFF37003D),
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Hours",
                              style: TextStyle(
                                  color: Color(0xFF9EA6C9),
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                            color: Color(0xFF37003D),
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                  color: Color(0xFF37003D),
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mins",
                              style: TextStyle(
                                  color: Color(0xFF9EA6C9),
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                            color: Color(0xFF37003D),
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "59",
                              style: TextStyle(
                                  color: Color(0xFF37003D),
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sec",
                              style: TextStyle(
                                  color: Color(0xFF9EA6C9),
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getPredictWinWidget() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.0,
            offset: Offset(0, 0.3),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Predict & Win",
                  style: TextStyles.TitleTextNormalBoldStyle,
                ),
              ),
              Visibility(
                visible: false,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Edit",
                      style: TextStyles.TitleTextNormalBoldStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.0, top: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    "assets/images/ic_liverpool.svg",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF9F9F9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.0),
                                      ),
                                    ),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      style:
                                          TextStyles.TitleTextNormalBoldStyle,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.only(left: 8.0),
                                          labelText: 'Score',
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.36),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ButtonColorPrimary),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: ColorPrimary))),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Container(
                                      height: 1.0,
                                      width: 2.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: 55,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF9F9F9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.0),
                                      ),
                                    ),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      style:
                                          TextStyles.TitleTextNormalBoldStyle,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.only(left: 8.0),
                                          labelText: 'Score',
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.36),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ButtonColorPrimary),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: ColorPrimary))),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    "assets/images/ic_arsenal.svg",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Liverpool",
                  style: TextStyles.TitleTextNormalBoldStyle,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Sat,Sep 12 | 11:00",
                        style: TextStyle(
                          color: ButtonColorPrimary,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Arsenal",
                  style: TextStyles.TitleTextNormalBoldStyle,
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              "Tottenham Hotspur Stadium",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorPrimary,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getNextItemPredictionWidget(gameWeek, urlA, urlB, teamA, teamB) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.0,
            offset: Offset(0, 0.3),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ButtonColorPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Game week $gameWeek",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.0, top: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          urlA,
                                          width: 75,
                                          height: 75,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 55,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF9F9F9),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2.0),
                                            ),
                                          ),
                                          child: TextField(
                                            cursorColor: Colors.black,
                                            style: TextStyles
                                                .TitleTextNormalBoldStyle,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 8.0),
                                                labelText: 'Score',
                                                labelStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.36),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ButtonColorPrimary),
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                ColorPrimary))),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: Container(
                                            height: 1.0,
                                            width: 2.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          width: 55,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF9F9F9),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2.0),
                                            ),
                                          ),
                                          child: TextField(
                                            cursorColor: Colors.black,
                                            style: TextStyles
                                                .TitleTextNormalBoldStyle,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 8.0),
                                                labelText: 'Score',
                                                labelStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.36),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ButtonColorPrimary),
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                ColorPrimary))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          urlB,
                                          width: 75,
                                          height: 75,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        teamA,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.TitleTextNormalBoldStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Sat,Sep 12 | 11:00",
                              style: TextStyle(
                                color: ButtonColorPrimary,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        teamB,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.TitleTextNormalBoldStyle,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Tottenham Hotspur Stadium",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPrimary,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
