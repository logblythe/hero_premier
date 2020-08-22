import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/services/shared_pref_helper.dart';
import 'package:hero_premier/core/view_models/setting_view_model.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/settings/widget/circle_image.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switchValue = true;
  BuildContext _context;
  SettingViewModel _settingViewModel;
  String token;

  void onChanged(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    SharedPrefHelper.sharedPreferences.then((value) => token=value.getString(KEY_TOKEN));

    return BaseWidget<SettingViewModel>(
      model: SettingViewModel(
        navigationService: Provider.of(context),
        settingService: Provider.of(context),
      ),
      builder: (context,model,child){
        _settingViewModel=model;
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                getTopWidget(),
                getBottomWidget(),
              ],
            ),
          ),
        );

      },
    );
  }

  Widget getTopWidget() {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyles.TitleTextNormalStyle,
                    ),
                    Text(
                      "Ramesh Thakuri",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFF9EA6C9),
                          size: 18.0,
                        ),
                        Text(
                          "Newroad, Kathmandu",
                          style: TextStyle(
                            color: Color(0xFF9EA6C9),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircleImage(
                onPress: _handleProfileClick,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Arsenal",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    SvgPicture.asset(
                      'assets/images/ic_arsenal.svg',
                      width: 26.0,
                      height: 26.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  "Favourite Club",
                  style: TextStyle(
                    color: Color(0xFF9EA6C9),
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "165",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Overal pts",
                        style: TextStyle(
                            color: Color(0xFF9EA6C9),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 16.0),
                      height: 16.0,
                      width: 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF9EA6C9),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "45",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Overal Rank",
                        style: TextStyle(
                            color: Color(0xFF9EA6C9),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24, bottom: 28),
            child: SecondaryButton(
              label: 'LOGOUT',
              onPress: _handleLogout,
            ),
          )
        ],
      ),
    );
  }

  Widget getBottomWidget() {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "More",
              style:
                  TextStyle(color: ColorPrimary, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Color(0xFF9EA6C9).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/images/ic_notification.svg",
                              width: 8.0,
                              height: 8.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Notification",
                          style: TextStyle(
                              color: Color(0xFF9EA6C9),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Switch(
                      value: _switchValue,
                      onChanged: onChanged,
                      activeColor: ButtonColorPrimary,
                      activeTrackColor: Color(0xFF9EA6C9),
                      inactiveTrackColor: Color(0xFF9EA6C9),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Color(0xFF9EA6C9).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/images/ic_password.svg",
                              width: 8.0,
                              height: 8.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "Change password",
                          style: TextStyle(
                              color: Color(0xFF9EA6C9),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF9EA6C9),
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Color(0xFF9EA6C9).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/images/ic_info.svg",
                              width: 8.0,
                              height: 8.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "About us",
                          style: TextStyle(
                              color: Color(0xFF9EA6C9),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF9EA6C9),
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Color(0xFF9EA6C9).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/images/ic_privacy.svg",
                              width: 8.0,
                              height: 8.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Privacy policy",
                          style: TextStyle(
                              color: Color(0xFF9EA6C9),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF9EA6C9),
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Color(0xFF9EA6C9).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/images/ic_disclaimer.svg",
                              width: 8.0,
                              height: 8.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Disclaimer",
                          style: TextStyle(
                              color: Color(0xFF9EA6C9),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF9EA6C9),
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleLogout() {
//    Navigator.of(context).popUntil((route) => route.isFirst);
  _settingViewModel.logout(token);
  }

  _handleProfileClick() {
    Navigator.of(_context).pushNamed(RoutePaths.PROFILE);
  }
}
