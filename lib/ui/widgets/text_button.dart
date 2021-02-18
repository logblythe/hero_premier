import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class TextButtonWidget extends StatelessWidget {
  final String label;
  final Function onPress;

  const TextButtonWidget({Key key, this.label, this.onPress}) : super(key: key);


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
