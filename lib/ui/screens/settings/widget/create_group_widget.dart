import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';

class CreateGroupWidget extends StatelessWidget {
  final Function onPressCreate;
  final Function onPressJoinGroup;

  CreateGroupWidget({Key key, this.onPressCreate, this.onPressJoinGroup})
      : assert(onPressCreate != null, onPressJoinGroup);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 2.0,
            offset: Offset(0, 0.3),
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Container(
                        width: 3.0,
                        height: 16.0,
                        decoration: UIHelper.boxDecorationLine(context),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: UIHelper.boxDecorationCircle(context),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AssetPaths.IC_TEAM,
                            width: 44.0,
                            height: 44.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: Material(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    child: InkWell(
                      onTap: () => onPressJoinGroup(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          "JOIN GROUP",
                          style: TextStyles.Subtitle2.copyWith(
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create a group",
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    "Make a group then win,share gift with friends and loves one.",
                    style: TextStyles.Subtitle2.copyWith(
                      color: Colors.black.withOpacity(0.87),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: ()=>onPressCreate(),
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "+",
                      style: TextStyles.Subtitle2.copyWith(
                          color: Theme.of(context).accentColor),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "CREATE NOW",
                      style: TextStyles.Subtitle2.copyWith(
                          color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
