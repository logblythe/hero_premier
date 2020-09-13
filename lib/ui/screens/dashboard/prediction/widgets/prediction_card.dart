import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/prediction/prediction_result.dart';
import 'package:hero_premier/core/view_models/dashboard_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/circular_cached_network_image.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:hero_premier/utils/utilities.dart';
import 'package:provider/provider.dart';

class PredictionCard extends StatefulWidget {
  final PredictionResult prediction;
  final bool editable;
  final bool isResult;

  const PredictionCard({
    Key key,
    this.prediction,
    this.editable = false,
    this.isResult = false,
  }) : super(key: key);

  @override
  _PredictionCardState createState() => _PredictionCardState();
}

class _PredictionCardState extends State<PredictionCard> {
  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();

  bool _edit = false;
  PredictionResult _prediction;
  DashboardViewModel _model;

  @override
  void initState() {
    super.initState();
    _prediction = widget.prediction;
    _controllerA.text = _prediction.firstTeamScorePrediction.toString();
    _controllerB.text = _prediction.secondTeamScorePrediction.toString();
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
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: widget.editable
              ? BoxDecoration(color: Colors.white)
              : UIHelper.boxDecoration(context),
          child: Column(
            children: [
              header(),
              SizedBox(height: 24),
              Row(
                children: [
                  clubNameImage(
                    imageUrl: _prediction.matchId.firstTeamId.image,
                    name: _prediction.matchId.firstTeamId.name,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 24),
                      child: details(),
                    ),
                  ),
                  clubNameImage(
                    imageUrl: _prediction.matchId.secondTeamId.image,
                    name: _prediction.matchId.secondTeamId.name,
                  ),
                ],
              ),
              SizedBox(height: 24),
              footer(),
            ],
          ),
        );
      },
    );
  }

  Widget header() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            widget.isResult ? "Final score" : "Predict & Win",
            style: TextStyles.TitleTextNormalBoldStyle,
          ),
        ),
        Visibility(
          visible: widget.editable && _controllerA.text != null,
          child: Align(
            alignment: Alignment.centerRight,
            child: IgnorePointer(
              ignoring: _model.loading,
              child: InkWell(
                onTap: _toggleEdit,
                child: Text(
                  _edit ? "Cancel" : "Edit",
                  style: TextStyles.Subtitle2.copyWith(
                      color: Theme.of(context).accentColor),
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
                      hintText: 'Score',
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
                      hintText: 'Score',
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
          getFormattedTimeFromUtc(_prediction.matchId.matchTime),
          style: TextStyle(
            color: ButtonColorPrimary,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        //todo fetch the stadium
        Text(
          "Stadium",
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

  _handlePrediction() async{
    FocusScope.of(context).requestFocus();
    await _model.postPrediction(_controllerA.text ?? "0", _controllerB.text ?? "0",
        _prediction.matchId.id);
    setState(() => _edit = !_edit);

  }

  _toggleEdit() {
    if (_model.error != null) {
      _model.setError(null);
    }
    if (_edit) {
      _controllerA.text = _prediction.firstTeamScorePrediction.toString();
      _controllerB.text = _prediction.secondTeamScorePrediction.toString();
    }
    setState(() => _edit = !_edit);
  }
}
