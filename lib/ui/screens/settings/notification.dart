import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../shared/asset_paths.dart';
import '../../shared/text_styles.dart';
import '../../widgets/custom_appbar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBarWithBack(EmptyList.NOTIFICATION, context),
      body: SingleChildScrollView(
        child: getDefaultWidget(),
      ),
    );
  }

  Widget getDefaultWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      margin: EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetPaths.IC_NO_NOTIFICATION),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "No notifications yet",
              textAlign: TextAlign.center,
              style: TextStyles.Subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "We'll let you know when there will be something new for you.",
                textAlign: TextAlign.center,
                style: TextStyles.Subtitle2.copyWith(
                  color: Color.fromRGBO(0, 0, 0, 0.54),
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
