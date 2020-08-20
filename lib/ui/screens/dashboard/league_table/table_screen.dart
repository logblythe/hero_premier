import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/models/LeagueData.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/widgets/center_text.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';

class TableScreen extends StatefulWidget {
  final bool fullTable;

  const TableScreen({Key key, this.fullTable}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  bool _fullTable;
  BuildContext _context;
  List<LeagueData> _datas = [
    LeagueData(1, AssetPaths.ARSENAL, "Arsenal", "Ars", 1, 2, 3, 4, 5, 6),
    LeagueData(2, AssetPaths.CHELSEA, "Chelsea", "Che", 0, 0, 0, 0, 0, 0),
    LeagueData(3, AssetPaths.LIVERPOOL, "Liverpool", "Ars", 0, 0, 0, 0, 0, 0),
    LeagueData(4, AssetPaths.MANCHESTER_CITY, "Manchester City", "MCI", 0, 0, 0,
        0, 0, 0),
    LeagueData(5, AssetPaths.MANCHESTER_UNITED, "Manchester United", "MUN", 0,
        0, 0, 0, 0, 0),
    LeagueData(1, AssetPaths.ARSENAL, "Arsenal", "Ars", 1, 2, 3, 4, 5, 6),
    LeagueData(2, AssetPaths.CHELSEA, "Chelsea", "Che", 0, 0, 0, 0, 0, 0),
    LeagueData(3, AssetPaths.LIVERPOOL, "Liverpool", "Ars", 0, 0, 0, 0, 0, 0),
    LeagueData(4, AssetPaths.MANCHESTER_CITY, "Manchester City", "MCI", 0, 0, 0,
        0, 0, 0),
    LeagueData(5, AssetPaths.MANCHESTER_UNITED, "Manchester United", "MUN", 0,
        0, 0, 0, 0, 0),
    LeagueData(1, AssetPaths.ARSENAL, "Arsenal", "Ars", 1, 2, 3, 4, 5, 6),
    LeagueData(2, AssetPaths.CHELSEA, "Chelsea", "Che", 0, 0, 0, 0, 0, 0),
    LeagueData(3, AssetPaths.LIVERPOOL, "Liverpool", "Ars", 0, 0, 0, 0, 0, 0),
    LeagueData(4, AssetPaths.MANCHESTER_CITY, "Manchester City", "MCI", 0, 0, 0,
        0, 0, 0),
    LeagueData(5, AssetPaths.MANCHESTER_UNITED, "Manchester United", "MUN", 0,
        0, 0, 0, 0, 0),
    LeagueData(1, AssetPaths.ARSENAL, "Arsenal", "Ars", 1, 2, 3, 4, 5, 6),
    LeagueData(2, AssetPaths.CHELSEA, "Chelsea", "Che", 0, 0, 0, 0, 0, 0),
    LeagueData(3, AssetPaths.LIVERPOOL, "Liverpool", "Ars", 0, 0, 0, 0, 0, 0),
    LeagueData(4, AssetPaths.MANCHESTER_CITY, "Manchester City", "MCI", 0, 0, 0,
        0, 0, 0),
    LeagueData(5, AssetPaths.MANCHESTER_UNITED, "Manchester United", "MUN", 0,
        0, 0, 0, 0, 0),
    LeagueData(1, AssetPaths.ARSENAL, "Arsenal", "Ars", 1, 2, 3, 4, 5, 6),
    LeagueData(2, AssetPaths.CHELSEA, "Chelsea", "Che", 0, 0, 0, 0, 0, 0),
    LeagueData(3, AssetPaths.LIVERPOOL, "Liverpool", "Ars", 0, 0, 0, 0, 0, 0),
    LeagueData(4, AssetPaths.MANCHESTER_CITY, "Manchester City", "MCI", 0, 0, 0,
        0, 0, 0),
    LeagueData(5, AssetPaths.MANCHESTER_UNITED, "Manchester United", "MUN", 0,
        0, 0, 0, 0, 0),
  ];

  @override
  void initState() {
    super.initState();
    _fullTable = widget.fullTable ?? false;
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            getHeaderWidget(),
          ],
        ),
      ),
    );
  }

  Widget getHeaderWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16.0,
          ),
          Text(
            "League Table",
            style: TextStyles.TitleTextNormalBoldStyle,
          ),
          Text(
            "2020/2021",
            style: TextStyle(
              color: ColorPrimary,
              fontSize: 12.0,
              fontFamily: "Levenim MT",
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 12.0),
          _fullTable ? getTableWidget() : getDefaultTableWidget(),
          _fullTable
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(top: 24),
                  width: 160,
                  child: PrimaryButton(
                    label: 'FULL TABLE',
                    onPress: _handleFullTable,
                  ),
                ),
        ],
      ),
    );
  }

  Widget getTableWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Table(
          children: [
            TableRow(
              children: [
                CenterText('Pos'),
                CenterText('Club'),
                CenterText(''),
                CenterText('P'),
                CenterText('W'),
                CenterText('D'),
                CenterText('L'),
                CenterText('GD'),
                CenterText('Pts'),
              ],
            ),
          ]..addAll(
              _datas
                  .map(
                    (data) => TableRow(
                      children: [
                        CenterText(data.pos.toString()),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SvgPicture.asset(
                            data.logoUrl,
                            width: 25,
                            height: 25.0,
                          ),
                        ),
                        CenterText(''),
                        CenterText(data.points.toString()),
                        CenterText(data.win.toString()),
                        CenterText(data.draw.toString()),
                        CenterText(data.loss.toString()),
                        CenterText(data.goalDifference.toString()),
                        CenterText(data.totalPoints.toString()),
                      ],
                    ),
                  )
                  .toList(),
            ),
        ),
      ),
    );
  }

  Widget getDefaultTableWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Table(
          columnWidths: {
            0: FractionColumnWidth(.1),
            1: FractionColumnWidth(.1),
            2: FractionColumnWidth(.5),
            3: FractionColumnWidth(.1),
            4: FractionColumnWidth(.1),
            5: FractionColumnWidth(.1),
          },
          children: [
            TableRow(
              children: [
                CenterText('Pos'),
                CenterText('Club'),
                CenterText(''),
                CenterText('P'),
                CenterText('GD'),
                CenterText('Pts'),
              ],
            ),
          ]..addAll(
              _datas
                  .map(
                    (data) => TableRow(
                      children: [
                        CenterText(data.pos.toString()),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SvgPicture.asset(
                            data.logoUrl,
                            width: 25,
                            height: 25.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 20),
                          child: Text(
                            data.name,
                            style: TextStyleTable,
                          ),
                        ),
                        CenterText(data.points.toString()),
                        CenterText(data.goalDifference.toString()),
                        CenterText(data.totalPoints.toString()),
                      ],
                    ),
                  )
                  .toList(),
            ),
        ),
      ),
    );
  }

  void _handleFullTable() {
    Navigator.of(_context).pushNamed(RoutePaths.FULL_TABLE);
  }
}
