import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/table_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/news/news_screen.dart';
import 'package:hero_premier/ui/screens/dashboard/prediction/prediction_result_screen.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.05),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewsScreen(showCount: 2),
            TableScreen(),
            SizedBox(height: 82),
            PredictionResultScreen(insideScrollView: true,),
          ],
        ),
      ),
    );
  }
}
