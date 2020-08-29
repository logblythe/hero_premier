import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final bool loading;
  final bool isDense;
  final Function onPress;
  final String label;
  final bool enabled;

  const SecondaryButton({Key key,
    this.loading = false,
    this.onPress,
    this.label,
    this.enabled = true,
    this.isDense = false})
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
            borderRadius: BorderRadius.circular(10)),
        padding: !isDense
            ? const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        )
            : EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: TextStyles.Subtitle2.copyWith(color: Colors.white),
            ),
          ],
        ),
        onPressed: enabled ? () => onPress() : null,
        color: Theme
            .of(context)
            .accentColor,
        disabledColor: Theme
            .of(context)
            .accentColor
            .withOpacity(0.36),
      ),
    );
  }
}
