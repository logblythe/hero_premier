import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero_premier/core/view_models/change_password_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:hero_premier/validator_mixin.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with ValidationMixing {
  BuildContext _context;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
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
              onPressed: () => Navigator.pop(context),
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
      },
    );
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
              decoration: UIHelper.boxDecoration(context),
              child: Form(
                key: _formKey,
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
            ),
            SizedBox(height: 32.0),
            SecondaryButton(
              label: 'UPDATE',
              loading: _viewModel.loading,
              onPress: _handleUpdatePassword,
            )
          ],
        ),
      ),
    );
  }

  Widget getOldPasswordWidget() {
    return FloatingInput(
      title: 'Old Password',
      validator: isEmptyValidation,
      controller: _oldPasswordController,
      obscureText: _viewModel.obscure["oldPassword"],
      suffixIcon: InkWell(
        child: Icon(Icons.remove_red_eye),
        onTap: _viewModel.toggleOldPassword,
      ),
    );
  }

  Widget getNewPasswordWidget() {
    return FloatingInput(
      title: 'New Password',
      validator: isEmptyValidation,
      controller: _newPasswordController,
      obscureText: _viewModel.obscure["newPassword"],
      suffixIcon: InkWell(
        child: Icon(Icons.remove_red_eye),
        onTap: _viewModel.toggleNewPassword,
      ),
    );
  }

  Widget getConfirmPasswordWidget() {
    return FloatingInput(
      title: 'Confirm Password',
      validator: isEmptyValidation,
      controller: _confirmPasswordController,
      obscureText: _viewModel.obscure["confirmPassword"],
      suffixIcon: InkWell(
        child: Icon(Icons.remove_red_eye),
        onTap: _viewModel.toggleConfirmPassword,
      ),
      errorText: _viewModel.passwordNotMatchError,
    );
  }

  _handleUpdatePassword() {
    if (_formKey.currentState.validate()) {
      if (_newPasswordController.text != _confirmPasswordController.text) {
        _viewModel.setPasswordNotMatchError("Password don't match.");
      } else {
        _viewModel.setPasswordNotMatchError(null);
        _viewModel.changePassword(
            _oldPasswordController.text, _newPasswordController.text);
      }
    }
  }
}
