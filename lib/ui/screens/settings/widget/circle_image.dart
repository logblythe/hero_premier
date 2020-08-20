import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final Function() onPress;
  final double size;

  const CircleImage({Key key, this.onPress, this.size}) : super(key: key);

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
              child: Image.asset(
                "assets/images/ic_person.png",
                height: size ?? 90,
                width: size ?? 90,
                fit: BoxFit.cover,
              ),
            ),
            Align(
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
          ],
        ),
      ),
    );
  }
}
