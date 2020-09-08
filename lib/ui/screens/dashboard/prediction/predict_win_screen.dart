import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/todayList/today_result.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/widgets/today_prediction_card.dart';
import 'package:hero_premier/ui/screens/history/widgets/history_default_widget.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/dead_line_timer.dart';
import 'package:hero_premier/utils/constants.dart';
import 'package:provider/provider.dart';

class PredictWinScreen extends StatefulWidget {
  @override
  _PredictWinScreenState createState() => _PredictWinScreenState();
}

class _PredictWinScreenState extends State<PredictWinScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
      model: DashboardViewModel(
        dashboardService: Provider.of(context),
        navigationService: Provider.of(context),
        userService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.fetchCurrentPrediction();
      },
      builder: (context, model, child) {
        if (model.loading) {
          return (Center(child: CircularProgressIndicator()));
        } else if (model.error != null) {
          return Text(model.error.toString());
        } else {
          if (model.todayPredictions != null &&
              model.todayPredictions.length > 0) {
            List<TodayResult> predictions = model.todayPredictions;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DeadlineTimer(
                      DateTime.parse(predictions[0].matchTime),
                    ),
                  ),
                  PredictionTodayCard(
                    firstTeamId: predictions[0].firstTeamId,
                    secondTeamId: predictions[0].secondTeamId,
                    matchId: predictions[0].id,
                    matchTime: predictions[0].matchTime,
                    stadium: predictions[0].stadium.name,
                    weekNumber: predictions[0].weekNo,
                    editable: true,
                    index: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Next Prediction",
                      style: TextStyles.Heading5.copyWith(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: predictions.length -1 ,
                    itemBuilder: (context, index) {
                      return PredictionTodayCard(
                        firstTeamId: predictions[index+1].firstTeamId,
                        secondTeamId: predictions[index+1].secondTeamId,
                        matchId: predictions[index+1].id,
                        matchTime: predictions[index+1].matchTime,
                        stadium: predictions[index+1].stadium.name,
                        weekNumber: predictions[index+1].weekNo,
                        index: index+1,
                      );
                    },
                  )
                ],
              ),
            );
          } else {
            return HistoryDefaultWidget(type: EmptyList.PREDICTION);
          }
        }
      },
    );
  }
}
