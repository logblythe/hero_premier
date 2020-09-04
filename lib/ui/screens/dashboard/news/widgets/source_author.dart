import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class SourceAuthor extends StatelessWidget {
  final String source;
  final String authorUrl;
  final bool showAuthor;

  const SourceAuthor({
    Key key,
    this.source,
    this.authorUrl,
    this.showAuthor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 8),
          height: 30,
          width: 30,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: authorUrl,
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) {
                return Image.asset(AssetPaths.LOGO);
              },
            ),
          ),
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
