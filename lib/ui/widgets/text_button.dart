import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class TextButton extends StatelessWidget {
  final String label;
  final Function onPress;

  TextButton({this.label, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: Text(
        label,
        style: TextStyles.Subtitle2.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: onPress,
    );
  }
}
