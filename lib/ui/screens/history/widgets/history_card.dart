import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class HistoryCard extends StatelessWidget {
  final String gameWeek;
  final String scoreA;
  final String scoreB;
  final String teamA;
  final String teamB;
  final String urlA;
  final String urlB;

  const HistoryCard(
      {Key key,
      this.gameWeek,
      this.scoreA,
      this.scoreB,
      this.teamA,
      this.teamB,
      this.urlA,
      this.urlB})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 2.0,
            offset: Offset(0, 0.3),
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
                  "Game week $gameWeek",
                  style: TextStyles.TitleTextNormalBoldStyle,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Points\nScore",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            height: 1.4),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Container(
                        height: 37,
                        width: 64.0,
                        decoration: BoxDecoration(
                          color: ButtonColorPrimary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4.0),
                            bottomRight: Radius.circular(4.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/ic_points.svg"),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8.0, top: 16.0),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: ColorPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  scoreA,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: ColorPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  scoreB,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
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
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      teamA,
                      style: TextStyle(
                          color: ColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "1 : 3",
                      style: TextStyle(
                          color: ColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      teamB,
                      style: TextStyle(
                          color: ColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Final Score (FT)",
              style: TextStyles.TitleTextNormalBoldStyle,
            )),
          )
        ],
      ),
    );
  }
}
