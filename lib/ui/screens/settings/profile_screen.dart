import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/settings/widget/circle_image.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.05),
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
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleImage(size: 126),
      ),
    );
  }

  Widget getFullNameTextField() {
    return FloatingInput(title: 'Full Name');
  }

  Widget getDOBTextField() {
    return FloatingInput(title: 'Date of Birth');
  }

  Widget getGenderTextField() {
    return FloatingInput(title: 'Gender');
  }

  Widget getAddressTextField() {
    return FloatingInput(title: 'Address');
  }

  Widget getContactNoTextField() {
    return FloatingInput(
      title: 'Contact',
      keyboardType: TextInputType.number,
    );
  }

  _handleUpdate() {
    Navigator.of(_context).pop();
  }
}
