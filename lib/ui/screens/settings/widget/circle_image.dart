import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class CircleImage extends StatelessWidget {
  final Function() onPress;
  final double size;
  final String path;
  final bool isVisible;

  const CircleImage({Key key, this.onPress, this.size,this.isVisible=true, this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "circle_image",
      child: Container(
        width: 90,
        height: 90,
        margin: EdgeInsets.only(right: 8.0),
        child: Stack(
          children: [
            ClipOval(
              child: path != null
                  ? Container(
                      color: ColorLightPurple.withOpacity(0.2),
                      padding: EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        path,
                        width: size ?? 90,
                        height: size ?? 90,
                      ),
                    )
                  : SvgPicture.asset(
                       path,
                      height: size ?? 90,
                      width: size ?? 90,
                      fit: BoxFit.cover,
                    ),
            ),
            Visibility(
              visible: isVisible,
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: onPress,
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 1.0,
                              offset: Offset(0, 0.5),
                              spreadRadius: 0.5)
                        ]),
                    child: Icon(
                      Icons.mode_edit,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
