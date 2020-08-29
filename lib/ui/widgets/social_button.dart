import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class SocialButton extends StatelessWidget {
  final bool loading;
  final Function onPress;
  final String label;
  final String imagePath;
  final Color color;

  const SocialButton(
      {Key key,
      this.loading = false,
      this.onPress,
      this.color,
      this.imagePath,
      this.label})
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset(imagePath),

                  Text(
                    label,
                    style: TextStyles.Subtitle2.copyWith(color: Colors.white),
                  ),
                ],
              ),
              onPressed: onPress ?? () => print('hello world'),
              color: color,
            ),
    );
  }
}
