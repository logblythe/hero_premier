import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/history/history_result.dart';
import 'package:hero_premier/core/view_models/history_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_card.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HistoryViewModel>(
      onModelReady: (model) {
        model.fetchHistory();
      },
      model: HistoryViewModel(
        historyService: Provider.of(context),
        userService: Provider.of(context),
      ),
      builder: (context, model, child) {
        if (model.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (model.error != null) {
          return ErrorCard(error: model.error);
        } else {
          return body(model);
        }
      },
    );
   /* return SingleChildScrollView(
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
          ],
        ),
      ),
    );*/
  }

  Widget body(HistoryViewModel model) {
    Map<String, List<HistoryResult>> _gameWeekMap = model.gameWeekMap;
    return ListView.builder(
        itemCount: _gameWeekMap.length,
        itemBuilder: (context, index) {
          return HistoryCard(
            gameWeek: _gameWeekMap.keys.elementAt(index).split(" ")[1],
            historyResult: _gameWeekMap.values.elementAt(index),
          );
        });
  }
}
