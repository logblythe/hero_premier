import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AssetPaths.NO_INTERNET_CONNECTION,
            alignment: Alignment.center,
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "No internet connected",
                    style: TextStyles.Heading4.copyWith(
                      color: Color(0xFF121212),
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Check your connection or try again",
                    style: TextStyles.Subtitle2.copyWith(
                      color: Color(0xFF121212),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: PrimaryButton(
                      label: "RECONNECT",
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
