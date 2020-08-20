import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> iconList;

  CustomBottomNavBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  List<String> _iconList = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];
    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(String icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: kBottomNavigationBarHeight,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
                width: 2, color: ButtonColorPrimary, style: BorderStyle.solid),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: _selectedIndex == index
                  ? SvgPicture.asset("assets/images/ic_bg_icon.svg")
                  : Text(""),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icon,
                color: _selectedIndex == index ? ColorPrimary : Colors.grey,
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 5 * 0.3,
                  height: 3.0,
                  margin: EdgeInsets.only(top: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    color:
                        _selectedIndex == index ? ColorPrimary : Colors.white,
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
