import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class RewardCardWidget extends StatelessWidget {
  final Color backgroundColor;
  final String icon;
  final String position;
  final String title;
  final String descripion;
  final Color buttonColor;
  final String backgroundImgUrl;
  final Color fontColor;
  final Function press;

  RewardCardWidget(
      {Key key,
      this.backgroundColor,
      this.icon,
      this.position,
      this.title,
      this.descripion,
      this.fontColor,
      this.press,
      this.backgroundImgUrl,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          image: DecorationImage(
            image: AssetImage(backgroundImgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Position",
                    style: TextStyles.Subtitle1.copyWith(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: fontColor,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    position,
                    style: TextStyles.Subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: fontColor,
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
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 24.0,
                ),
                Container(
                  height: 38,
                  width: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 1.0,
                            offset: Offset(0, 0.5),
                            spreadRadius: 0.5)
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 6.0),
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
                    height: 16.0,
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
                  InkWell(
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
                            "Learn More",
                            style: TextStyles.Subtitle1.copyWith(
                              color: fontColor,
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
      ),
    );
  }
}
