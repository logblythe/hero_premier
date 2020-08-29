import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class DeadlineTimer extends StatefulWidget {
  @override
  _DeadlineTimerState createState() => _DeadlineTimerState();
}

class _DeadlineTimerState extends State<DeadlineTimer> {
  Timer _timer;
  int _days = 0;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    Duration _duration = DateTime(2021).difference(DateTime.now());
    int _seconds = _duration.inSeconds;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _seconds = _seconds - 1;
      calculateCountDown(_seconds);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
                        _days.toString(),
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
                              _hours.toString(),
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
                              _minutes.toString(),
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
                              _seconds.toString(),
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

  void calculateCountDown(int sec) {
    var days = sec ~/ (24 * 60 * 60);
    int remainingSeconds = sec - (days * 24 * 60 * 60);
    var hours = remainingSeconds ~/ (60 * 60);
    int remainingSeconds2 = remainingSeconds - (hours * 60 * 60);
    var minutes = remainingSeconds2 ~/ 60;
    var seconds = remainingSeconds2 - (minutes * 60);
    setState(() {
      _days = days;
      _hours = hours;
      _minutes = minutes;
      _seconds = seconds;
    });
  }
}
