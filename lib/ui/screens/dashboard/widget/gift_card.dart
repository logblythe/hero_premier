import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/asset_paths.dart';
import '../../../shared/text_styles.dart';
import '../../../shared/ui_helpers.dart';

class GiftCard extends StatelessWidget {
  final String icon;
  final String points;
  final String title;
  final String descripion;
  final Color buttonColor;
  final Color fontColor;
  final Function press;

  GiftCard(
      {Key key,
      this.icon,
      this.points,
      this.title,
      this.descripion,
      this.buttonColor,
      this.fontColor,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(AssetPaths.IC_POINTS,width: 24,height: 24,),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  points,
                  style: TextStyles.Subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(
                width: 24.0,
              ),
              Container(
                height: 44,
                width: 44,
                decoration: UIHelper.boxDecorationCircle(context),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    icon,
                    width: 38.0,
                    height: 38.0,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: 32.0,
              top: 24.0,
              right: 16.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyles.Heading5.copyWith(
                    color: fontColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  descripion,
                  maxLines: 10,
                  style: TextStyles.Caption1.copyWith(
                    color: fontColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: InkWell(
                    onTap: () => press ?? print('clicked'),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "REDEEM",
                            style: TextStyles.Subtitle1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
