import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      body: SingleChildScrollView(
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
                          Text(
                            "Forgot password ?",
                            style: TextStyles.Subtitle2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: PrimaryButton(
                        label: "SIGN IN",
                        onPress: _handleLogin,
                      ),
                    )
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
    );
  }

  Widget getPasswordTextField() {
    return FloatingInput(
      title: "Password",
      controller: _passwordController,
      obscureText: true,
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
    Navigator.of(_buildContext).pushNamed(RoutePaths.REGISTER);
  }

  _handleLogin() {
    Navigator.of(_buildContext).pushNamed(RoutePaths.HOME);
  }
}
