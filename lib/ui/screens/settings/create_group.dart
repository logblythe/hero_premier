import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/screens/settings/widget/circle_image.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/floating_input.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        title: Text(
          "Create Group",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 72.0),
                      padding:EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: UIHelper.boxDecoration(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 64.0,),
                          getGroupNameInput(),
                          SizedBox(height: 24.0,),
                          SecondaryButton(
                            label: "SAVE & CREATE",
                          ),
                          SizedBox(height: 24.0,),
                        ],
                      ),
                    ),
                  ),
                  getProfileWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getProfileWidget() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 126,
        width: 126,
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color(0xFFE5E5E5),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                AssetPaths.IC_TEAM,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getGroupNameInput(){
    return FloatingInput(
      title: "Group Name",
    );
  }
}
