import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';

class JoinGroupDialogWidget extends StatefulWidget {
  @override
  _JoinGroupDialogWidgetState createState() => _JoinGroupDialogWidgetState();
}

class _JoinGroupDialogWidgetState extends State<JoinGroupDialogWidget>
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
                        "JOIN GROUP",
                        style: TextStyles.Heading4,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Input the code that your group member had share to you",
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
                        color: Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: FloatingInput(
                          title: "Group code id",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    PrimaryButton(
                      label: "JOIN NOW",
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
