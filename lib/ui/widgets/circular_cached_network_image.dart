import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';

class CircularCachedNetworkImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;

  const CircularCachedNetworkImage({Key key, this.url, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: url,
        height: height ?? 60,
        width: width ?? 60,
        fit: BoxFit.cover,
        useOldImageOnUrlChange: false,
        placeholder: (context, url) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(strokeWidth: 0.5),
        ),
        errorWidget: (context, url, error) {
          return Image.asset(AssetPaths.LOGO);
        },
      ),
    );
  }
}
