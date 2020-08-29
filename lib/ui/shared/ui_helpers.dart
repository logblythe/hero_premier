import 'package:flutter/material.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 24.0;
  static const double _VerticalSpaceLarge = 48.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 24.0;
  static const double _HorizontalSpaceLarge = 48.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);

  static BoxDecoration boxDecoration(context) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 2.0,
            offset: Offset(0, 0.3),
            spreadRadius: 0.5,
          )
        ],
      );

  static BoxDecoration boxDecorationLine(context) => BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      );

  static BoxDecoration boxDecorationCircle(context) => BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFFEBEBEB),
            Color(0xFF00FFFFFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        ),
      );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.grey[700],
    brightness: Brightness.dark,
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.red[400],
    backgroundColor: Colors.grey[200],
    brightness: Brightness.light,
  );
}
