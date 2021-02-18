import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/core/view_models/registration_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/register/widgets/register_first.dart';
import 'package:hero_premier/ui/screens/register/widgets/register_second.dart';
import 'package:hero_premier/ui/screens/register/widgets/register_third.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/widgets/dialog_card.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _index = 0;
  PageController _controller;
  User _user;
  RegisterViewModel _registerVM;

  @override
  void initState() {
    super.initState();
    _user = User();
    _controller = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseWidget<RegisterViewModel>(
        model: RegisterViewModel(
          userService: Provider.of(context),
          navigationService: Provider.of(context),
        ),
        builder: (context, vm, _) {
          _registerVM = vm;
          return Stack(
            children: <Widget>[
              IgnorePointer(
                ignoring: vm.loading,
                child: Container(
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
                          physics: NeverScrollableScrollPhysics(),
                          controller: _controller,
                          children: <Widget>[
                            RegisterFirst(
                              onNext: _handleFirstNext,
                              onBack: _handleFirstBack,
                            ),
                            RegisterSecond(
                              onNext: _handleSecondNext,
                              onBack: _handleSecondBack,
                            ),
                            RegisterThird(
                              onNext: _handleThirdNext,
                              onBack: _handleThirdBack,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              vm.loading
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              vm.dialogContent != null
                  ? DialogCard(
                      error: vm.dialogContent,
                      onPress: () {
                        vm.setShowDialog(null);
                        vm.navigateClubSelect();
                      },
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }

  _handleFirstNext(User user) {
    _user.email = user.email;
    _user.password = user.password;
    _registerVM.checkUniqueMail(_user.email).then(
      (res) {
        if (_registerVM.error == null)
          _controller.animateToPage(
            1,
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
      },
    );
  }

  _handleFirstBack() {
    Navigator.of(context).pop();
  }

  _handleSecondNext(User user) {
    _user.name = user.name;
    _user.dob = user.dob;
    _user.gender = user.gender;
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

  _handleThirdNext(User user) {
    _user.address = user.address;
    _user.phoneNumber = user.phoneNumber;
    _registerVM.register(_user);
  }

  _handleThirdBack() {
    _controller.animateToPage(
      1,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }
}
