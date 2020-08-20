import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:hero_premier/ui/widgets/text_button.dart';

class RegisterThird extends StatelessWidget {
  final Function() onNext;
  final Function() onBack;

  const RegisterThird({Key key, this.onNext, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getHeaderWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 32.0),
                      getAddressTextField(),
                      SizedBox(height: 32.0),
                      getPhoneTextField(),
                      SizedBox(height: 32.0),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        getFooterWidget(),
      ],
    );
  }

  Widget getHeaderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.play_arrow,
                color: ColorPrimary,
                size: 24.0,
                semanticLabel: 'Play',
              ),
              Text(
                "Step 2/2",
                style: TextStyles.TitleTextNormalStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
            "Mailing Info",
            style: TextStyles.HeadingTextStyle,
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
            "Enter the mailing address information",
            style: TextStyle(
              color: TextColor,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }

  getAddressTextField() => FloatingInput(
        title: 'Address',
      );

  getPhoneTextField() => FloatingInput(
        title: "Contact Number",
        keyboardType: TextInputType.number,
      );

  Widget getFooterWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom:32.0,left: 48,right: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            label: 'Back',
            onPress: onBack,
          ),
          SecondaryButton(
            label: 'Done',
            onPress: onNext,
          )
        ],
      ),
    );
  }
}
