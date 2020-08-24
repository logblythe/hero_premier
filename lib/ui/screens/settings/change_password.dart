import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero_premier/core/view_models/change_password_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  BuildContext _context;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _oldPasswordController;
  TextEditingController _newPasswordController;
  TextEditingController _confirmPasswordController;
  ChangePasswordViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return BaseWidget<ChangePasswordViewModel>(
        model: ChangePasswordViewModel(
          navigationService: Provider.of(context),
          userService: Provider.of(context),
        ),
        builder: (_, model, child) {
          _viewModel = model;
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 75.0,
              title: Text(
                "Change Password",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Stack(
              children: [
                IgnorePointer(
                  ignoring: _viewModel.loading,
                  child: body(),
                )
              ],
            ),
          );
        });
  }

  Widget body() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2.0,
                    offset: Offset(0, 0.3),
                    spreadRadius: 0.5,
                  )
                ],
              ),
              child: Column(
                children: [
                  getOldPasswordWidget(),
                  SizedBox(height: 32.0),
                  getNewPasswordWidget(),
                  SizedBox(height: 32.0),
                  getConfirmPasswordWidget(),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            SecondaryButton(
              label: 'UPDATE',
              onPress: (){},
            )

          ],
        ),

      ),
    );
  }

  Widget getOldPasswordWidget() {
    return FloatingInput(
      title: 'Old Password',
      controller: _oldPasswordController,
      obscureText: _viewModel.obscureText,
      suffixIcon: InkWell(
        child: Icon(Icons.remove_red_eye),
        onTap: () {
          _viewModel.toggleObscureText();
        },
      ),
    );
  }

  Widget getNewPasswordWidget() {
    return FloatingInput(
      title: 'New Password',
      controller: _newPasswordController,
      obscureText: _viewModel.obscureText,
      suffixIcon: InkWell(
        child: Icon(Icons.remove_red_eye),
        onTap: () {
          _viewModel.toggleObscureText();
        },
      ),
    );
  }

  Widget getConfirmPasswordWidget() {
    return FloatingInput(
      title: 'Confirm Password',
      controller: _confirmPasswordController,
      obscureText: _viewModel.obscureText,
      suffixIcon: InkWell(
        child: Icon(Icons.remove_red_eye),
        onTap: () {
          _viewModel.toggleObscureText();
        },
      ),
    );
  }
}
