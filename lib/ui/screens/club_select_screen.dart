import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:hero_premier/ui/widgets/text_button.dart';

class Club {
  String name;
  String logoUrl;

  Club(this.name, this.logoUrl);
}

class ClubSelectScreen extends StatefulWidget {
  @override
  _ClubSelectScreenState createState() => _ClubSelectScreenState();
}

class _ClubSelectScreenState extends State<ClubSelectScreen> {
  int _selectedIndex;
  List<Club> _clubs = [
    Club("Arsenal", AssetPaths.ARSENAL),
    Club("Chelsea", AssetPaths.CHELSEA),
    Club("Liverpool", AssetPaths.LIVERPOOL),
    Club("Manchester City", AssetPaths.MANCHESTER_CITY),
    Club("Manchester United", AssetPaths.MANCHESTER_UNITED),
    Club("Arsenal", AssetPaths.ARSENAL),
    Club("Chelsea", AssetPaths.CHELSEA),
    Club("Liverpool", AssetPaths.LIVERPOOL),
    Club("Manchester City", AssetPaths.MANCHESTER_CITY),
    Club("Manchester United", AssetPaths.MANCHESTER_UNITED),
    Club("Arsenal", AssetPaths.ARSENAL),
    Club("Chelsea", AssetPaths.CHELSEA),
    Club("Liverpool", AssetPaths.LIVERPOOL),
    Club("Manchester City", AssetPaths.MANCHESTER_CITY),
    Club("Manchester United", AssetPaths.MANCHESTER_UNITED),
    Club("Arsenal", AssetPaths.ARSENAL),
    Club("Chelsea", AssetPaths.CHELSEA),
    Club("Liverpool", AssetPaths.LIVERPOOL),
    Club("Manchester City", AssetPaths.MANCHESTER_CITY),
    Club("Manchester United", AssetPaths.MANCHESTER_UNITED),
    Club("Arsenal", AssetPaths.ARSENAL),
    Club("Chelsea", AssetPaths.CHELSEA),
    Club("Liverpool", AssetPaths.LIVERPOOL),
    Club("Manchester City", AssetPaths.MANCHESTER_CITY),
    Club("Manchester United", AssetPaths.MANCHESTER_UNITED),
  ];
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 8, top: 42),
                        child: Text(
                          "Let\'s Go",
                          style: TextStyles.Subtitle1.copyWith(
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 12, left: 8),
                        child: Text(
                          'Choose your favourite team',
                          style: TextStyles.Heading5.copyWith(
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          itemCount: _clubs.length,
                          itemBuilder: (context, index) {
                            Club _club = _clubs.elementAt(index);
                            return clubCard(_club, context, index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: Offset(0, 8),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      label: 'Skip',
                      onPress: _handleSkip,
                    ),
                    SecondaryButton(
                      label: 'Continue',
                      enabled: _selectedIndex != null,
                      onPress: _handleContinue,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget clubCard(Club _club, BuildContext context, int index) {
    bool selected = index == _selectedIndex;
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () => _handleClubSelect(index),
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
                      child: SvgPicture.asset(_club.logoUrl),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    child: Text(
                      _club.name,
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

  void _handleClubSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _handleSkip() {
    Navigator.of(_context).pushNamed(RoutePaths.HOME);
  }

  _handleContinue() {
    Navigator.of(_context).pushNamed(RoutePaths.HOME);
  }
}
