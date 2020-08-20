import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class WinnerCard extends StatelessWidget {
  final String name;
  final String week;
  final String weekPoint;
  final String totalPoints;
  final String url;
  final Function() onTap;

  const WinnerCard(
      {Key key,
      this.name,
      this.week,
      this.weekPoint,
      this.totalPoints,
      this.url,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Game\nWeek",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8.0,
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
                    child: Center(
                      child: Text(
                        week,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              url,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: TextStyles.TitleTextNormalBoldStyle,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Week point ",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.54),
                                                  fontSize: 12.0),
                                            ),
                                            Text(
                                              weekPoint,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        double.parse(getLength(totalPoints)),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total point ",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.54),
                                            fontSize: 12.0),
                                      ),
                                      Text(
                                        totalPoints,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getLength(String points) {
    String length;
    switch (points.length) {
      case 5:
        length = "5.5";
        break;
      case 4:
        length = "5.5";
        break;
      case 3:
        length = "5.5";
        break;
      case 2:
        length = "5.5";
        break;
      default:
        length = "0";
        break;
    }
    return length;
  }
}
