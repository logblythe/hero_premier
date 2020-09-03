import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/history/history_result.dart';
import 'package:hero_premier/core/view_models/history_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_card.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_default_widget.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:hero_premier/ui/widgets/paginating_card.dart';
import 'package:hero_premier/utils/api_response.dart';
import 'package:hero_premier/utils/constants.dart';
import 'package:provider/provider.dart';

//design fixes
class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HistoryViewModel>(
      model: HistoryViewModel(
        historyService: Provider.of(context),
        userService: Provider.of(context),
        winnerService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.fetchHistory();
        _controller.addListener(() {
          if (_controller.position.pixels ==
              _controller.position.maxScrollExtent) {
            model.fetchHistoryMore();
          }
        });
      },
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
  }

  Widget body(HistoryViewModel model) {
    Map<String, List<HistoryResult>> _gameWeekMap = model.gameWeekMap;
    return _gameWeekMap.length == 0
        ? HistoryDefaultWidget(type: EmptyList.HISTORY)
        : ListView.builder(
            controller: _controller,
            itemCount: _gameWeekMap.length,
            itemBuilder: (context, index) {
              String gameWeek =
                  _gameWeekMap.keys.elementAt(index).split(" ")[1];
              List<HistoryResult> histories =
                  _gameWeekMap.values.elementAt(index);
              int totalObtainedScore = 0;
              histories.forEach((element) {
                totalObtainedScore = element.obtainedScore + totalObtainedScore;
              });
              return Column(
                children: [
                  HistoryCard(
                    gameWeek: gameWeek,
                    historyResult: histories,
                    totalObtainedScore: totalObtainedScore,
                  ),
                  (index == _gameWeekMap.length - 1 &&
                          model.status == Status.PAGINATING)
                      ? PaginatingCard()
                      : Container()
                ],
              );
            },
          );
  }
}
