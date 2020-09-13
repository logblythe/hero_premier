import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/view_models/login_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';
import 'package:hero_premier/ui/widgets/social_button.dart';
import 'package:hero_premier/ui/widgets/welcome_modal.dart';
import 'package:hero_premier/validator_mixin.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixing {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController =
      TextEditingController(text: "sikshyamaharjan123@gmail.com");
  TextEditingController _passwordController =
      TextEditingController(text: "12345678");
  LoginViewModel _model;
  final facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseWidget<LoginViewModel>(
        model: LoginViewModel(
          navigationService: Provider.of(context),
          userService: Provider.of(context),
        ),
        builder: (context, model, child) {
          _model = model;
          return Stack(
            children: <Widget>[
              IgnorePointer(ignoring: model.loading, child: body(model)),
              model.loading
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              model.error != null
                  ? ErrorCard(
                      error: model.error,
                      onPress: () => {model.setError(null)},
                    )
                  : Container(),
              model.dialogContent != null
                  ? WelcomeModal(
                      name: model.username.split(" ").elementAt(0),
                      onPress: () {
                        model.setDialogContent(null);
                        model.navigateHome();
                      },
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }

  Widget body(LoginViewModel model) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHeaderWidget(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(48, 48, 48, 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Let\'s start with \nlogin",
                            style: TextStyles.Heading1,
                          ),
                          SizedBox(height: 24),
                          getEmailTextField(),
                          SizedBox(height: 32),
                          getPasswordTextField(),
                          SizedBox(height: 24),
                          InkWell(
                            onTap: _handleForgotPassword,
                            child: Text(
                              "Forgot password ?",
                              style: TextStyles.Subtitle2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: PrimaryButton(
                      label: "SIGN IN",
                      onPress: _handleLogin,
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: SocialButton(
                      imagePath: AssetPaths.IC_FACEBOOK,
                      label: "LOGIN WITH FACEBOOK",
                      color: Color(0xFF285CE3),
                      onPress: _handleFacebookLogin,
                    ),
                  ),
                ],
              ),
              getFooterWidget(),
            ],
          ),
          Positioned(
            top: 190,
            child: SvgPicture.asset(
              AssetPaths.LOGIN_GRADIENT,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeaderWidget() {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image(
              width: double.infinity,
              height: 210,
              fit: BoxFit.cover,
              image: AssetImage(AssetPaths.LOGIN_BACKGROUND),
            ),
          ],
        ),
        Container(
          height: 210,
          color: Colors.black.withOpacity(0.3),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 38, left: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                height: 80.0,
                width: 75.0,
                padding: const EdgeInsets.all(8),
                child: Image(
                  width: 32.0,
                  height: 52.0,
                  image: AssetImage(AssetPaths.LOGO),
                  color: ColorPrimary,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Welcome to",
                style: TextStyles.Heading5.copyWith(color: Colors.white),
              ),
              Text(
                "Premier Hero",
                style: TextStyles.Heading1.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
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

  Widget getPasswordTextField() {
    return FloatingInput(
      title: "Password",
      controller: _passwordController,
      obscureText: _model.obscureText,
      suffixIcon: InkWell(
        child: Icon(Icons.remove_red_eye),
        onTap: () {
          _model.toggleObscureText();
        },
      ),
      validator: validatePassword,
    );
  }

  Widget getFooterWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Don\'t have an account? ",
            style: TextStyles.Body.copyWith(color: Theme.of(context).hintColor),
          ),
          InkWell(
            onTap: _handleRegister,
            child: Text(
              'Create one',
              style: TextStyles.Subtitle2.copyWith(
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _handleRegister() {
    _model.register();
  }

  void _handleLogin() {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      _model.login(_emailController.text, _passwordController.text);
    }
  }

  void _handleForgotPassword() {
    _model.forgotPassword();
  }

  Future<Null> _handleFacebookLogin() async {
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _model.fbLogin(accessToken.token);

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }
}
