import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';
import 'package:hero_premier/ui/widgets/text_button.dart';

class RegisterFirst extends StatelessWidget {
  final Function() onNext;
  final Function() onBack;

  const RegisterFirst({Key key, this.onNext, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
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
                  SizedBox(height: 16.0),
                  getEmailTextField(),
                  SizedBox(height: 32.0),
                  getPasswordTextField(),
                  SizedBox(height: 32.0),
                  getConfirmPasswordTextField(),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
          getFooterWidget(),
        ],
      ),
    );
  }

  Widget getHeaderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Signup",
          style: TextStyles.TitleTextNormalStyle,
        ),
        Text(
          "Premier Hero",
          style: TextStyles.HeadingTextStyle,
        ),
        SizedBox(height: 16.0),
        Text(
          "Enter the information below to create\nan account",
          style: TextStyle(
            color: TextColor,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget getEmailTextField() => FloatingInput(
        title: 'Email',
        keyboardType: TextInputType.emailAddress,
      );

  getPasswordTextField() => FloatingInput(
        title: "Password",
        obscureText: true,
      );

  getConfirmPasswordTextField() => FloatingInput(
        title: "Confirm Password",
        obscureText: true,
      );

  Widget getFooterWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom:32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            label: 'Login Now',
            onPress: onBack,
          ),
          PrimaryButton(
            label: 'Continue',
            onPress: onNext,
          )
        ],
      ),
    );
  }
}
