import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_premier/core/models/table/league_data.dart';
import 'package:hero_premier/core/models/table/season.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/router.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/widgets/center_text.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class TableScreen extends StatefulWidget {
  final bool fullTable;

  const TableScreen({Key key, this.fullTable}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  bool _fullTable;
  BuildContext _context;
  List<LeagueData> _table;
  Season _season;

  @override
  void initState() {
    super.initState();
    _fullTable = widget.fullTable ?? false;
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return BaseWidget<DashboardViewModel>(
      model: DashboardViewModel(
          userService: Provider.of(context),
          navigationService: Provider.of(context)),
      onModelReady: (model) {
        model.fetchTables();
      },
      builder: (context, model, child) {
        if (model.loading) {
          return (Center(child: CircularProgressIndicator()));
        } else if (model.error != null) {
          return Text(model.error.toString());
        } else {
          _season = model.season;
          if (_fullTable)
            _table = model.standings.elementAt(0).table;
          else
            _table = model.standings.elementAt(0).table.sublist(0, 5);
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.only(bottom: 32),
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    "League Table",
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                  Text(
                    '${_season.startDate.split("-")[0]}/${_season.endDate.split("-")[0]}',
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
            ),
          );
        }
      },
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
              _table
                  .map(
                    (data) => TableRow(
                      children: [
                        CenterText(data.position.toString()),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SvgPicture.network(
                            data.team.crestUrl,
                            height: 60,
                            width: 60,
                            placeholderBuilder: (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                        CenterText(''),
                        CenterText(data.points.toString()),
                        CenterText(data.won.toString()),
                        CenterText(data.draw.toString()),
                        CenterText(data.lost.toString()),
                        CenterText(data.goalDifference.toString()),
                        CenterText(data.points.toString()),
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
              _table
                  .map(
                    (data) => TableRow(
                      children: [
                        CenterText(data.position.toString()),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child:SvgPicture.network(
                            data.team.crestUrl,
                            height: 60,
                            width: 60,
                            placeholderBuilder: (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 20),
                          child: Text(
                            data.team.name,
                            style: TextStyleTable,
                          ),
                        ),
                        CenterText(data.points.toString()),
                        CenterText(data.goalDifference.toString()),
                        CenterText(data.points.toString()),
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
