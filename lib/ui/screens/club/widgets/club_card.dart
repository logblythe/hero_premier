import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/club/club.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class ClubCard extends StatelessWidget {
  final Club club;
  final bool selected;
  final Function() onSelect;

  const ClubCard({Key key, this.club, this.selected, this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: onSelect,
          child: Container(
            margin: EdgeInsets.all(8),
            child: Container(
              height: 108,
              width: 108,
              decoration: BoxDecoration(
                border: selected
                    ? Border.all(color: Theme.of(context).accentColor, width: 2)
                    : Border.all(color: Colors.white, width: 2),
                color: selected ? Theme.of(context).cardColor : Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(0, 1))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 18),
                      height: 48,
                      width: 48,
                      child: CachedNetworkImage(
                        imageUrl: club.image,
                        placeholder: (context, url) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    child: Text(
                      club.name,
                      style: TextStyles.Subcaption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: selected
              ? Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    size: 16,
                    color: Theme.of(context).accentColor,
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
