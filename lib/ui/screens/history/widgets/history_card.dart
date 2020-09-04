import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/models/history/history_result.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class HistoryCard extends StatelessWidget {
  final String gameWeek;
  final List<HistoryResult> historyResult;
  final int totalObtainedScore;

  const HistoryCard({
    Key key,
    this.gameWeek,
    this.historyResult,
    this.totalObtainedScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      SizedBox(width: 4.0),
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
                            SizedBox(width: 4.0),
                            Text(
                              totalObtainedScore.toString(),
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
          ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: historyResult.map((historyResult) {
                return matchInfo(historyResult, context);
              }).toList()),
        ],
      ),
    );
  }

  Widget matchInfo(HistoryResult historyResult, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.0, top: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: historyResult.matchId.firstTeamId.image,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.asset(AssetPaths.LOGO),
                          height: 40,
                          width: 40,
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
                                historyResult.matchId.firstTeamScore.toString(),
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
                                historyResult.matchId.secondTeamScore
                                    .toString(),
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
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: historyResult.matchId.secondTeamId.image,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.asset(AssetPaths.LOGO),
                          height: 40,
                          width: 40,
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
                    historyResult.matchId.firstTeamId.name,
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
                    "${historyResult.firstTeamScorePrediction} : ${historyResult.secondTeamScorePrediction} ",
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
                    historyResult.matchId.secondTeamId.name,
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
        Text(
          "Final Score (FT)",
          style: TextStyles.Caption1,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 24),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(2)),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Points Scored : ",
                style: TextStyles.Caption2.copyWith(
                    color: Theme.of(context).accentColor.withOpacity(0.87)),
              ),
              Text(
                "${historyResult.obtainedScore}",
                style: TextStyles.Caption1.copyWith(
                    color: Theme.of(context).accentColor.withOpacity(0.87)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
