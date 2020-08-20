import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_card.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

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
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                getHeaderWidget(),
                getListOfGame(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getHeaderWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                Hero(
                  tag: "winner",
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/ic_person_6.png",
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Suman Sapkota",
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
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "4th",
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
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "45",
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
          SizedBox(
            height: 8.0,
          ),
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
                            SizedBox(
                              width: 4.0,
                            ),
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

  Widget getListOfGame() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          HistoryCard(
              gameWeek: "36",
              scoreA: "1",
              scoreB: "2",
              teamA: "Liverpool",
              teamB: "Arsenal",
              urlA: "assets/images/ic_liverpool.svg",
              urlB: "assets/images/ic_arsenal.svg"),
          HistoryCard(
              gameWeek: "35",
              scoreA: "5",
              scoreB: "3",
              teamA: "Man United",
              teamB: "Man City",
              urlA: "assets/images/ic_manchester_united.svg",
              urlB: "assets/images/ic_manchester_city.svg"),
          HistoryCard(
              gameWeek: "34",
              scoreA: "1",
              scoreB: "2",
              teamA: "Tottenham",
              teamB: "Chelsea",
              urlA: "assets/images/ic_tottenham.svg",
              urlB: "assets/images/ic_chelsea.svg"),
        ],
      ),
    );
  }
}
