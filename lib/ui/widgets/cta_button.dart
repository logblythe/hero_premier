import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class CTAButton extends StatelessWidget {
  final bool loading;
  final Function onPress;
  final String label;

  const CTAButton({Key key, this.loading = false, this.onPress, this.label})
      : assert(label != null, onPress != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(child: child, scale: animation),
      duration: Duration(milliseconds: 250),
      child: loading
          ? CircularProgressIndicator()
          : RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Text(
                label,
                style: TextStyles.Subtitle2,
              ),
              onPressed: onPress,
              color: Theme.of(context).backgroundColor,
            ),
    );
  }
}
