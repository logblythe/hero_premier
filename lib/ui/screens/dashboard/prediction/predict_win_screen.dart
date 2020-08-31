import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/prediction/prediction_result.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/widgets/prediction_card.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/dead_line_timer.dart';
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
          List<PredictionResult> predictions = model.predictions;
          PredictionResult _firstPrediction = predictions[0];
          List<PredictionResult> _restPredictions = predictions.sublist(1);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DeadlineTimer(
                    DateTime.parse(_firstPrediction.matchId.matchTime),
                  ),
                ),
                PredictionCard(
                  prediction: _firstPrediction,
                  editable: true,
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
                  itemCount: _restPredictions.length,
                  itemBuilder: (context, index) {
                    return PredictionCard(
                      prediction: _restPredictions[index],
                    );
                  },
                )
              ],
            ),
          );
        }
      },
    );
  }
}