import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/prediction/prediction_result.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/shared/ui_helpers.dart';
import 'package:hero_premier/ui/widgets/circular_cached_network_image.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';

class PredictionCard extends StatefulWidget {
  final PredictionResult prediction;
  final bool current;

  const PredictionCard({Key key, this.prediction, this.current = false})
      : super(key: key);

  @override
  _PredictionCardState createState() => _PredictionCardState();
}

class _PredictionCardState extends State<PredictionCard> {
  bool _edit = false;
  PredictionResult _prediction;

  @override
  void initState() {
    super.initState();
    _prediction = widget.prediction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: widget.current
          ? EdgeInsets.symmetric(vertical: 16)
          : EdgeInsets.all(16),
      decoration: widget.current
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
  }

  Widget header() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Predict & Win",
            style: TextStyles.TitleTextNormalBoldStyle,
          ),
        ),
        Visibility(
          visible: true,
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: _handleEditPress,
              child: Text(
                "Edit",
                style: TextStyles.Subtitle2.copyWith(
                    color: Theme.of(context).accentColor),
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
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.25),
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
          padding: EdgeInsets.symmetric(horizontal: widget.current ? 24 : 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
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
                      labelText: 'Score',
                      labelStyle: TextStyle(
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
                    EdgeInsets.symmetric(horizontal: widget.current ? 12 : 6),
                child: Text("-"),
              ),
              Expanded(
                child: TextField(
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
                      labelText: 'Score',
                      labelStyle: TextStyle(
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
          getFormattedTime(_prediction.matchId.matchTime),
          style: TextStyle(
            color: ButtonColorPrimary,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
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
        ? SizedBox(
            width: 120,
            child: SecondaryButton(
              isDense: true,
              label: "PREDICT",
              onPress: _handlePrediction,
            ),
          )
        : Container();
  }

  _handlePrediction() {
    setState(() {
      _edit = false;
    });
  }

  _handleEditPress() {
    setState(() {
      _edit = !_edit;
    });
  }

  String getFormattedTime(String matchTime) {
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateUtc, true);

    var date = Duration.
  }
}
