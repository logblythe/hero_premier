import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/models/login/local.dart';
import 'package:hero_premier/core/view_models/profile_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/settings/widget/circle_image.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/widgets/dialog_card.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:hero_premier/validator_mixin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ValidationMixing {
  ProfileViewModel _profileViewModel;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController;
  TextEditingController _dobController;
  TextEditingController _genderController;
  TextEditingController _addressController;
  TextEditingController _contactController;
  TextEditingController _emailAddressController;
  Local local;
  dynamic _user;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProfileViewModel>(
      model: ProfileViewModel(
        navigationService: Provider.of(context),
        userService: Provider.of(context),
        winnerService: Provider.of(context),
      ),
      onModelReady: (model) async {
        _user = model.user;
        _fullNameController = TextEditingController(text: _user.name);
        _dobController = TextEditingController(text: _user.dob);
        _genderController = TextEditingController();
        _addressController = TextEditingController(text: _user.address);
        _contactController = TextEditingController(text: _user.phoneNumber);
        _emailAddressController = TextEditingController(text: _user.email);
      },
      builder: (context, model, child) {
        _profileViewModel = model;
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 75.0,
            title: Text(
              "Edit Profile",
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
                ignoring: model.loading,
                child: body(),
              ),
              model.dialogContent != null
                  ? DialogCard(
                      error: _profileViewModel.setShowDialog(null),
                      onPress: () {
                        _profileViewModel.setShowDialog(null);
                        _profileViewModel.navigateSetting();
                      },
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 45.0),
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
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 72.0, left: 16.0, right: 16.0, bottom: 16.0),
                        child: Column(
                          children: [
                            getFullNameTextField(),
                            SizedBox(height: 24.0),
                            getDOBTextField(),
                            SizedBox(height: 24.0),
                            getGenderTextField(),
                            SizedBox(height: 24.0),
                            getAddressTextField(),
                            SizedBox(height: 24.0),
                            getContactNoTextField(),
                            SizedBox(height: 24.0),
                            getEmailAddressTextField(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  getProfileWidget(),
                ],
              ),
              SizedBox(height: 24.0),
              SecondaryButton(
                label: 'UPDATE',
                onPress: _handleUpdate,
                loading: _profileViewModel.loading,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getProfileWidget() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 126,
        width: 126,
        margin: const EdgeInsets.only(right: 8.0),
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleImage(
          size: 126,
          path: _profileViewModel.updatedImageUrl != null
              ? _profileViewModel.updatedImageUrl
              : (_user.image != null && _user.image.isNotEmpty)
                  ? _user.image
                  : AssetPaths.IC_NO_HISTORY,
          onPress: () {
            _profileViewModel.pickImage(ImageSource.gallery);
          },
        ),
      ),
    );
  }

  Widget getFullNameTextField() {
    return FloatingInput(
      title: 'Full Name',
      controller: _fullNameController,
      validator: validateFullName,
    );
  }

  Widget getDOBTextField() {
    return FloatingInput(
      title: 'Date of Birth',
      controller: _dobController,
      validator: isEmptyValidation,
    );
  }

  Widget getGenderTextField() {
    return FloatingInput(
      title: 'Gender',
      controller: _genderController,
    );
  }

  Widget getAddressTextField() {
    return FloatingInput(
      title: 'Address',
      controller: _addressController,
      validator: isEmptyValidation,
    );
  }

  Widget getContactNoTextField() {
    return FloatingInput(
      title: 'Contact',
      keyboardType: TextInputType.number,
      controller: _contactController,
      validator: isEmptyValidation,
    );
  }

  Widget getEmailAddressTextField() {
    return FloatingInput(
      title: 'Email',
      controller: _emailAddressController,
      isEnable: false,
      suffixIcon: SvgPicture.asset(AssetPaths.IC_LINK),
    );
  }

  _handleUpdate() {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      _profileViewModel.updateProfile(
        _fullNameController.text,
        _dobController.text,
        _genderController.text,
        _addressController.text,
        _contactController.text,
      );
    }
  }
}
