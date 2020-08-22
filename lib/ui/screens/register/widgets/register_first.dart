import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';
import 'package:hero_premier/ui/widgets/text_button.dart';
import 'package:hero_premier/validator_mixin.dart';

class RegisterFirst extends StatefulWidget  {
  final Function(User) onNext;
  final Function() onBack;

  RegisterFirst({Key key, this.onNext, this.onBack}) : super(key: key);

  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> with AutomaticKeepAliveClientMixin,ValidationMixing {

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
      );

  getPasswordTextField() => FloatingInput(
        title: "Password",
        controller: passwordController,
        obscureText: true,
        validator: validatePassword,
      );

  getConfirmPasswordTextField() => FloatingInput(
        title: "Confirm Password",
        controller: passwordConfirmController,
        obscureText: true,
        validator: validatePassword,
      );

  Widget getFooterWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            label: 'Login Now',
            onPress: widget.onBack,
          ),
          PrimaryButton(
            label: 'Continue',
            onPress: _handleNext,
          )
        ],
      ),
    );
  }

  _handleNext() {
    if (formKey.currentState.validate()) {
      if (passwordController.text == passwordConfirmController.text) {
        User user = User(
          email: emailController.text,
          password: passwordController.text,
        );
        widget.onNext(user);
      } else {
        //todo set password incorrect error
      }
    }
  }

  @override
  bool get wantKeepAlive =>true;
}
