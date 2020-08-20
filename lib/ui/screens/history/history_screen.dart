import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_card.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).backgroundColor,
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
      ),
    );
  }
}
