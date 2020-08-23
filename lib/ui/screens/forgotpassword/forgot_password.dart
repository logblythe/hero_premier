import 'package:flutter/material.dart';
import 'package:hero_premier/core/view_models/forgot_password_view_model.dart';
import 'package:hero_premier/core/view_models/login_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';
import 'package:hero_premier/validator_mixin.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with ValidationMixing {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  ForgotPasswordViewModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: BaseWidget<ForgotPasswordViewModel>(
        model: ForgotPasswordViewModel(
          navigationService: Provider.of(context),
          userService: Provider.of(context),
        ),
        builder: (context, model, child) {
          _model = model;

          return Stack(
            children: [
              IgnorePointer(ignoring: model.loading,child: body(_model),),
              _model.error != null
                  ? ErrorCard(
                      error: _model.error,
                      onPress: () => {_model.setError(null)},
                    )
                  : Container(),
              _model.dialogContent != null
                  ? ErrorCard(
                      error: _model.dialogContent,
                      onPress: () {
                        _model.setDialogContent(null);
                        _model.navigateHome();
                      },
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }

  Widget body(ForgotPasswordViewModel forgotPasswordViewModel) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: 16.0,
          left: 32,
          right: 32,
          bottom: 16,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHeaderWidget(),
                  SizedBox(
                    height: 32.0,
                  ),
                  getEmailTextField(),
                  SizedBox(height: 64),
                  PrimaryButton(
                    label: "SUBMIT",
                    onPress: _handleSendEmail,
                    loading: _model.loading,
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: InkWell(
                      onTap: _handleBackToHome,
                      child: Text(
                        "Back to Login",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getHeaderWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 80.0,
            height: 142.0,
            image: AssetImage("assets/images/logo_purple.png"),
            color: ColorPrimary,
          ),
          Text(
            "Forgot Password",
            style: TextStyles.TitleTextNormalStyle,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Premier Hero",
            style: TextStyles.Heading1,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Enter your email and we will send you a\nlink to reset your password",
            style: TextStyle(
              color: TextColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget getEmailTextField() {
    return FloatingInput(
      title: "Email",
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
    );
  }

  void _handleBackToHome() {
    _model.navigateHome();
  }

  void _handleSendEmail() {
    if (_formKey.currentState.validate()) {
      _model.sendEmailForgotPassword(_emailController.text);
    }
  }
}
