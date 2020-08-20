import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final bool loading;
  final Function onPress;
  final String label;

  const PrimaryButton({Key key, this.loading = false, this.onPress, this.label})
      : assert(label != null, onPress != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(child: child, scale: animation),
      duration: Duration(milliseconds: 250),
      child: loading
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            )
          : RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
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
              onPressed: onPress ?? () => print('hello world'),
              color: Theme.of(context).primaryColor,
            ),
    );
  }
}
