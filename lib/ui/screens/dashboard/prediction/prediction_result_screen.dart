import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/prediction/prediction_result.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/widgets/prediction_card.dart';
import 'package:provider/provider.dart';

class PredictionResultScreen extends StatefulWidget {
  @override
  _PredictionResultScreenState createState() => _PredictionResultScreenState();
}

class _PredictionResultScreenState extends State<PredictionResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
      model: DashboardViewModel(
        dashboardService: Provider.of(context),
        navigationService: Provider.of(context),
        userService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.fetchPastPrediction();
      },
      builder: (context, model, child) {
        if (model.loading) {
          return (Center(child: CircularProgressIndicator()));
        } else if (model.error != null) {
          return Text(model.error.toString());
        } else {
          List<PredictionResult> predictions = model.predictions;
          return Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: predictions.length,
              itemBuilder: (context, index) {
                return PredictionCard(prediction: predictions[index]);
              },
            ),
          );
        }
      },
    );
  }
}
