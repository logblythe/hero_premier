import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_premier/core/models/table/table_data.dart';
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
  List<TableData> _table;

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
        dashboardService: Provider.of(context),
        navigationService: Provider.of(context),
        userService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.fetchTables();
      },
      builder: (context, model, child) {
        if (model.loading) {
          return (Center(child: CircularProgressIndicator()));
        } else if (model.error != null) {
          return Text(model.error.toString());
        } else {
          if (_fullTable)
            _table = model.tableResponse.table;
          else
            _table = model.tableResponse.table.sublist(0, 5);
          return Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                    model.tableResponse.stage,
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
      child: Table(
        columnWidths: {
          0: FractionColumnWidth(.1),
          1: FractionColumnWidth(.1),
          2: FractionColumnWidth(.26),
          3: FractionColumnWidth(.1),
          4: FractionColumnWidth(.09),
          5: FractionColumnWidth(.09),
          6: FractionColumnWidth(.09),
          7: FractionColumnWidth(.09),
          8: FractionColumnWidth(.09),
          9: FractionColumnWidth(.09),
        },
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
        ]
          ..addAll(
            _table
                .map(
                  (data) =>
                  TableRow(
                    children: [
                      CenterText(
                        data.position.toString(),
                        focus: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: CachedNetworkImage(
                          imageUrl: data.team.icon,
                          height: 30,
                          width: 30,
                          placeholder: (ctx, url) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 14),
                        child: Text(
                          data.team.code,
                          style: TextStyleTable.copyWith(
                              color: Theme
                                  .of(context)
                                  .primaryColor),
                        ),
                      ),
                      CenterText(data.playedGames.toString()),
                      CenterText(data.won.toString()),
                      CenterText(data.draw.toString()),
                      CenterText(data.lost.toString()),
                      CenterText(data.goalDifference.toString()),
                      CenterText(
                        data.points.toString(),
                        focus: true,
                      ),
                    ],
                  ),
            )
                .toList(),
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
          ]
            ..addAll(
              _table
                  .map(
                    (data) =>
                    TableRow(
                      children: [
                        CenterText(
                          data.position.toString(),
                          focus: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: CachedNetworkImage(
                            imageUrl: data.team.icon,
                            height: 30,
                            width: 30,
                            placeholder: (ctx, url) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 40,
                            top: 14,
                            bottom: 12,
                          ),
                          child: Text(
                            data.team.short,
                            style: TextStyleTable.copyWith(
                                color: Theme
                                    .of(context)
                                    .primaryColor),
                          ),
                        ),
                        CenterText(data.playedGames.toString()),
                        CenterText(data.goalDifference.toString()),
                        CenterText(
                          data.points.toString(),
                          focus: true,
                        ),
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
