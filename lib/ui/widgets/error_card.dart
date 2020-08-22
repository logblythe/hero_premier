import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';

class ErrorCard extends StatelessWidget {
  final String error;
  final Function onPress;

  const ErrorCard({Key key, this.error, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.black.withOpacity(0.4),
      width: double.infinity,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(32),
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(error.toString(),style: TextStyles.Subtitle2,),
              UIHelper.verticalSpaceMedium,
              SecondaryButton(label: 'Ok', onPress: onPress),
            ],
          ),
        ),
      ),
    );
  }
}
