import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';

class WelcomeModal extends StatelessWidget {
  final String name;
  final Function() onPress;

  const WelcomeModal({Key key, this.name = 'User', this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.black.withOpacity(0.8),
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          padding:
              const EdgeInsets.only(top: 24, bottom: 44, left: 48, right: 48),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                AssetPaths.LOGO,
                height: 132,
                width: 82,
              ),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Namaste, ',
                      style: TextStyles.Heading4.copyWith(
                          color: Theme.of(context).primaryColor)),
                  Text(
                    name,
                    style: TextStyles.Heading1.copyWith(
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to Premier Hero with the season of Premier League, we have come up with a way where one can not just only enjoy their game, but gain rewards in return on the matches they predict. ",
                style: TextStyles.Body.copyWith(
                    color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 120,
                child: SecondaryButton(
                  label: 'Ok',
                  onPress: onPress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
