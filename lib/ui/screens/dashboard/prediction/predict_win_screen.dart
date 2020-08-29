import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/widgets/prediction_card.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/dead_line_timer.dart';

class PredictWinScreen extends StatefulWidget {
  @override
  _PredictWinScreenState createState() => _PredictWinScreenState();
}

class _PredictWinScreenState extends State<PredictWinScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DeadlineTimer(),
          ),
          PredictionCard(current: true),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Next Prediction",
              style: TextStyles.Heading5.copyWith(
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          PredictionCard(),
        ],
      ),
    );
  }
}
