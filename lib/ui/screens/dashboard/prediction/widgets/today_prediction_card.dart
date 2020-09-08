import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_premier/core/models/todayList/first_team_id.dart';
import 'package:hero_premier/core/models/todayList/second_team_id.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/circular_cached_network_image.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:hero_premier/utils/utilities.dart';
import 'package:provider/provider.dart';

class PredictionTodayCard extends StatefulWidget {
  final FirstTeamId firstTeamId;
  final SecondTeamId secondTeamId;
  final String stadium;
  final String matchTime;
  final String matchId;
  final String weekNumber;
  final bool editable;
  final int index;

  const PredictionTodayCard({
    Key key,
    this.editable = false,
    this.firstTeamId,
    this.secondTeamId,
    this.stadium,
    this.matchTime,
    this.matchId,
    this.weekNumber,
    this.index,
  }) : super(key: key);

  @override
  _PredictionTodayCardState createState() => _PredictionTodayCardState();
}

class _PredictionTodayCardState extends State<PredictionTodayCard> {
  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();

  bool _edit;

  bool _isFirstCard;

  DashboardViewModel _model;

  @override
  void initState() {
    super.initState();
    _edit = false;
    _isFirstCard = widget.index == 0;
    //todo pre-fill the prediction
    // _controllerA.text = _prediction.firstTeamScorePrediction.toString();
    // _controllerB.text = _prediction.secondTeamScorePrediction.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
      model: DashboardViewModel(
        dashboardService: Provider.of(context),
        navigationService: Provider.of(context),
        userService: Provider.of(context),
      ),
      onModelReady: (model) {
        _model = model;
      },
      builder: (context, model, child) {
        return Container(
          margin: widget.editable
              ? EdgeInsets.symmetric(vertical: 16)
              : EdgeInsets.all(16),
          decoration: widget.editable
              ? BoxDecoration(color: Colors.white)
              : UIHelper.boxDecoration(context),
          child: Column(
            children: [
              header(),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    clubNameImage(
                      imageUrl: widget.firstTeamId.image,
                      name: widget.firstTeamId.name,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 24),
                        child: details(),
                      ),
                    ),
                    clubNameImage(
                      imageUrl: widget.secondTeamId.image,
                      name: widget.secondTeamId.name,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              footer(),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget header() {
    return Stack(
      children: [
        _isFirstCard
            ? Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Predict & Win",
                    style: TextStyles.TitleTextNormalBoldStyle,
                  ),
                ),
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                      ),
                    ),
                    ClipRRect(
                      child: SvgPicture.asset(
                        AssetPaths.GAME_WEEK_BG,
                        width: MediaQuery.of(context).size.width,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        "Game week ${widget.weekNumber.substring(widget.weekNumber.lastIndexOf(" "))}",
                        style:
                            TextStyles.Subtitle1.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 24),
          child: Visibility(
            visible: widget.editable && _controllerA.text != null,
            child: Align(
              alignment: Alignment.centerRight,
              child: IgnorePointer(
                ignoring: _model.loading,
                child: InkWell(
                  onTap: _handleEditPress,
                  child: Text(
                    _edit ? "Cancel" : "Edit",
                    style: TextStyles.Subtitle2.copyWith(
                        color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget clubNameImage({String imageUrl, String name}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: CircularCachedNetworkImage(
            url: imageUrl ?? "https://via.placeholder.com/150",
            width: 60,
            height: 60,
          ),
        ),
        SizedBox(height: 8),
        Text(
          name ?? "name",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.Subtitle2.copyWith(
              color: Theme.of(context).primaryColor),
        )
      ],
    );
  }

  Widget details({String team1Score, String team2Score}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: widget.editable ? 24 : 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controllerA,
                  enabled: _edit,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  style: _edit
                      ? TextStyles.TitleTextNormalBoldStyle
                      : TextStyles.TitleTextNormalBoldStyle.copyWith(
                          color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: _edit
                          ? Colors.grey.withOpacity(0.2)
                          : Theme.of(context).primaryColor,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 8.0),
                      hintText: '-',
                      hintStyle: TextStyle(
                        color: _edit
                            ? Colors.black.withOpacity(0.36)
                            : Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ButtonColorPrimary),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorPrimary))),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.editable ? 12 : 6),
                child: Text("-"),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controllerB,
                  enabled: _edit,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  style: _edit
                      ? TextStyles.TitleTextNormalBoldStyle
                      : TextStyles.TitleTextNormalBoldStyle.copyWith(
                          color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: _edit
                          ? Colors.grey.withOpacity(0.2)
                          : Theme.of(context).primaryColor,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 8.0),
                      hintText: '-',
                      hintStyle: TextStyle(
                        color: _edit
                            ? Colors.black.withOpacity(0.36)
                            : Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ButtonColorPrimary),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorPrimary))),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Text(
          getFormattedTimeFromUtc(widget.matchTime),
          style: TextStyle(
            color: ButtonColorPrimary,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        Text(
          widget.stadium ?? "Stadium",
          style: TextStyle(
            color: ButtonColorPrimary,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }

  Widget footer() {
    return _edit
        ? _model.error != null
            ? Container(
                color: Colors.red.withOpacity(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _model.error["message"],
                      style: TextStyles.Caption1.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            : SizedBox(
                width: 120,
                child: SecondaryButton(
                  loading: _model.loading,
                  isDense: true,
                  label: "PREDICT",
                  onPress: _handlePrediction,
                ),
              )
        : Container();
  }

  _handlePrediction() {
    _model.postPrediction(
        _controllerA.text ?? "0", _controllerB.text ?? "0", widget.matchId);
  }

  _handleEditPress() {
    if (_model.error != null) {
      _model.setError(null);
    }
    if (_edit) {
      _controllerB.clear();
      _controllerA.clear();
    }
    setState(() => _edit = !_edit);
  }
}
