import 'package:flutter/material.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/widgets/circular_cached_network_image.dart';

class RankCard extends StatelessWidget {
  final String name;
  final String pos;
  final String points;
  final String url;
  final bool self;
  final Function onSelect;

  const RankCard(
      {Key key,
      this.name,
      this.pos,
      this.points,
      this.url,
      this.onSelect,
      this.self = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: self ? Theme.of(context).accentColor : Colors.white,
          image: self
              ? DecorationImage(
                  image: AssetImage(AssetPaths.OWN_RANK_BG),
                  fit: BoxFit.fitWidth,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            margin: EdgeInsets.only(left: 16.0),
                            child: Row(
                              children: [CircularCachedNetworkImage(url: url)],
                            ),
                          ),
                          Align(
                            child: Container(
                              width: pos.length == 3 ? 32 : 48.0,
                              padding: EdgeInsets.all(4.0),
                              margin: EdgeInsets.only(left: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.56),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                pos,
                                style: TextStyle(
                                  color: self
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                  fontFamily: "Hind Madurai",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: self
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16.0),
                  child: Text(
                    points,
                    style: TextStyle(
                        color: self ? Colors.white : Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
