import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';

class InviteDialogWidget extends StatefulWidget {
  @override
  _InviteDialogWidgetState createState() => _InviteDialogWidgetState();
}

class _InviteDialogWidgetState extends State<InviteDialogWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Wrap(
            children: [
              Container(
                margin: EdgeInsets.all(24.0),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.0),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 76.0,
                      height: 76.0,
                      decoration: UIHelper.boxDecorationCircle(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: SvgPicture.asset(
                            AssetPaths.IC_TEAM,
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "INVITE FRIENDS",
                        style: TextStyles.Heading4,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Share the code with your friends to invite them",
                          textAlign: TextAlign.center,
                          style: TextStyles.Subtitle2.copyWith(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF454045).withOpacity(0.87),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 247, 247, 0.5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          "283AEDV",
                          style: TextStyles.Heading5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SecondaryButton(
                      label: "SHARE & INVITE",
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
