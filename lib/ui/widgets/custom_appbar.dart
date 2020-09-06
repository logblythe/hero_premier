import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(String title)
      : super(
    elevation: 1.0,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: TextColorGrey),
    ),
    backgroundColor: Colors.white,
  );

  static AppBar getAppBar(String title, {onNotificationPress, onSearchPress}) {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 75.0,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18.0, color: TextColor, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: TextColorGrey,
          ),
          onPressed: onSearchPress,
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: TextColorGrey,
          ),
          onPressed: onNotificationPress,
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset("assets/images/logo_purple.png"),
      ),
    );
  }

  static AppBar getAppBarGeneral(String title) {
    return AppBar(
      toolbarHeight: 75.0,
      elevation: 0.0,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18.0, color: TextColor, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset("assets/images/logo_purple.png"),
      ),
      backgroundColor: Color(0xFFFFFFFF),
    );
  }

  static AppBar getAppBarWithBack(String title, BuildContext context) {
   return AppBar(
      toolbarHeight: 75.0,
      title: Text(
        title,
        style: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        onPressed: () {
        },
      ),
    );
  }
}
