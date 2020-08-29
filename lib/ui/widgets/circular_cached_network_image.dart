import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        placeholder: (context, url) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        imageUrl: url,
        height: height ?? 60,
        width: width ?? 60,
        fit: BoxFit.cover,
      ),
    );
  }
}
