import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class HistoryDefaultWidget extends StatelessWidget {
  final String type;

  const HistoryDefaultWidget({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetPaths.IC_NO_HISTORY,
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "No game $type found yet !",
            style: TextStyles.Heading3.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            "You haven't played a game for now",
            style: TextStyles.Subtitle2.copyWith(
              color: Colors.black.withOpacity(0.54),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
