import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class SourceAuthor extends StatelessWidget {
  final String source;
  final bool showAuthor;

  const SourceAuthor({Key key, this.source, this.showAuthor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 8),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(AssetPaths.IC_GOAL),
        ),
        Column(
          children: <Widget>[
            Text(
              source,
              style: TextStyles.Body.copyWith(
                  color: Theme.of(context).primaryColor),
            ),
            showAuthor
                ? Text(
                    'Author, Aug 10',
                    style: TextStyles.Subcaption.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
