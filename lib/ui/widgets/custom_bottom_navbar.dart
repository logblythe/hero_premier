import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> iconList;
  final List<String> labelList;

  CustomBottomNavBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange,
      @required this.labelList});

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
      _navBarItemList
          .add(buildNavBarItem(_iconList[i], widget.labelList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(String icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 72,
        width: MediaQuery.of(context).size.width / _iconList.length,
        padding: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
                width: 2, color: ButtonColorPrimary, style: BorderStyle.solid),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: _selectedIndex == index ? 1 : 0,
                    child: SvgPicture.asset("assets/images/ic_bg_icon.svg"),
                  ),
                ),
                Align(
                  child: SvgPicture.asset(
                    icon,
                    color: _selectedIndex == index ? ColorPrimary : Colors.grey,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                      color:
                          _selectedIndex == index ? ColorPrimary : Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5 * 0.3,
              height: 3.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
                color: _selectedIndex == index ? ColorPrimary : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
