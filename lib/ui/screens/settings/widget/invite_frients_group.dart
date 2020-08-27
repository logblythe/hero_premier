import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';

class InviteFriendWidget extends StatelessWidget {
  final Function onPressFriend;
  final Function onPressInvite;

  InviteFriendWidget({this.onPressFriend, this.onPressInvite})
      : assert(onPressFriend != null, onPressInvite != null);

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
                child: InkWell(
                      onTap: () => onPressFriend(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Stack(
                      children: [
                        getFriendWidget("assets/images/ic_person_6.png", 72.0),
                        getFriendWidget("assets/images/ic_person_5.png", 48.0),
                        getFriendWidget("assets/images/ic_person_2.png", 24.0),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ClipOval(
                                child: Container(
                                  color: Color(0xFFEFECEF),
                                  child: Center(
                                      child: Text(
                                    "3+",
                                    style: TextStyles.Caption2.copyWith(
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
                    "Hero Group",
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Group Overall pts",
                              style: TextStyles.Caption2.copyWith(
                                color: Colors.black.withOpacity(0.87),
                              ),
                            ),
                            Text(
                              "1501",
                              style: TextStyles.Heading2.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Group Rank",
                                style: TextStyles.Caption2.copyWith(
                                  color: Colors.black.withOpacity(0.87),
                                ),
                              ),
                              Text(
                                "2nd",
                                style: TextStyles.Heading2.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
              onTap: ()=>onPressInvite(),
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
                      "INVITE FRIENDS",
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

  Widget getFriendWidget(String imgPath, double val) {
    return Padding(
      padding: EdgeInsets.only(right: val),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipOval(
              child: Image.asset(
                imgPath,
                width: 36.0,
                height: 36.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
