import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/user.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';
import 'package:hero_premier/ui/widgets/text_button.dart';
import 'package:hero_premier/validator_mixin.dart';

class RegisterSecond extends StatefulWidget {
  final Function() onBack;
  final Function(User) onNext;

  RegisterSecond({Key key, this.onNext, this.onBack}) : super(key: key);

  @override
  _RegisterSecondState createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond>
    with AutomaticKeepAliveClientMixin, ValidationMixing {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final dobController = TextEditingController();

  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        getFullNameTextField(),
                        SizedBox(height: 32.0),
                        getDateOfBirthTextField(),
                        SizedBox(height: 32.0),
                        getGenderTextField(),
                        SizedBox(height: 32.0),
                      ],
                    ),
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
                "Step 1/2",
                style: TextStyles.TitleTextNormalStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
            "Personal Info",
            style: TextStyles.HeadingTextStyle,
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Text(
            "Enter the personal information",
            style: TextStyle(
              color: TextColor,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }

  getFullNameTextField() => FloatingInput(
        title: 'Full Name',
        controller: nameController,
        validator: isEmptyValidation,
      );

  getDateOfBirthTextField() => FloatingInput(
        title: "Date of Birth",
        controller: dobController,
        validator: isEmptyValidation,
      );

  getGenderTextField() => FloatingInput(
        title: "Gender",
        controller: genderController,
        validator: isEmptyValidation,
      );

  Widget getFooterWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0, left: 48, right: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButtonWidget(
            label: 'Back',
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
    if (_formKey.currentState.validate()) {
      User user = User(
          name: nameController.text,
          dob: dobController.text,
          gender: genderController.text);
      widget.onNext(user);
    }
  }

  @override
  bool get wantKeepAlive =>true;
}
