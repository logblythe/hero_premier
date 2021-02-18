import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetPaths.NO_INTERNET,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'No internet connected',
                  style: TextStyles.Heading4,
                ),
                Text('Check your connection and try again')
              ],
            ),
          ),
        )
      ],
    );
  }
}
