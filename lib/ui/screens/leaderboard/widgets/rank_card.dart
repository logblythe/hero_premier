import 'package:flutter/material.dart';
import 'package:hero_premier/ui/widgets/circular_cached_network_image.dart';

class RankCard extends StatelessWidget {
  final String name;
  final String pos;
  final String points;
  final String url;

  const RankCard({Key key, this.name, this.pos, this.points, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: pos == "45th" ? Theme.of(context).accentColor : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
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
                            children: [
                              CircularCachedNetworkImage(
                                url: url,
                                height: 60,
                                width: 60,
                              )
                            ],
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
                                color: Theme.of(context).primaryColor,
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
                        color: pos == "45th"
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
                      color: pos == "45th" ? Colors.white : Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
