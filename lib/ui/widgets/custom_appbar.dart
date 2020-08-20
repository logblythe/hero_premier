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

  static PreferredSize getAppBar(String title) {
    return PreferredSize(
      preferredSize: Size.fromHeight(72.0),
      child: AppBar(
        elevation: 0.0,
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: TextColorGrey,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/logo_purple.png"),
        ),
      ),
    );
  }

  static PreferredSize getAppBarGeneral(String title) {
    return PreferredSize(
      preferredSize: Size.fromHeight(72.0),
      child: AppBar(
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
      ),
    );
  }
}
