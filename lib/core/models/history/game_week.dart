import 'package:hero_premier/core/models/history/history_result.dart';

//TODO: Not sure to delete
class GameWeek {
  int _gameWeek;
  int _totalScore;
  List<HistoryResult> _history;

  GameWeek({int gameWeek, int totalScore, List<HistoryResult> history})
      : _gameWeek = gameWeek,
        _totalScore = totalScore,
        _history = history;
}
