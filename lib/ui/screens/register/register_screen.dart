import 'package:flutter/material.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/screens/register/widgets/register_first.dart';
import 'package:hero_premier/ui/screens/register/widgets/register_second.dart';
import 'package:hero_premier/ui/screens/register/widgets/register_third.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _index = 0;
  PageController _controller;
  BuildContext _buildContext;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 48),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Image(
                width: 55,
                height: 89,
                image: AssetImage(AssetPaths.LOGO),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: _controller,
                children: <Widget>[
                  RegisterFirst(
                      onNext: () => _handleFirstNext(),
                      onBack: () => _handleFirstBack()),
                  RegisterSecond(
                      onNext: () => _handleSecondNext(),
                      onBack: () => _handleSecondBack()),
                  RegisterThird(
                      onNext: () => _handleThirdNext(),
                      onBack: () => _handleThirdBack()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleFirstNext() {
    _controller.animateToPage(
      1,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  _handleFirstBack() {
    Navigator.of(context).pop();
  }

  _handleSecondNext() {
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  _handleSecondBack() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  _handleThirdNext() {
    Navigator.of(_buildContext).pushNamed(RoutePaths.SELECT_CLUB);
  }

  _handleThirdBack() {
    _controller.animateToPage(
      1,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }
}
