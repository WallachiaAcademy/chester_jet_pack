import 'package:shared_preferences/shared_preferences.dart';

UserData userData = UserData();

class UserData {
  final String _bestScoreKey = "__best_score__";

  int _bestScore = 0;
  int _curScore = 0;

  int getBestScore() => _bestScore;
  int getCurScore() => _curScore;

  void setScore(int score) {
    if (score > _bestScore) {
      _bestScore = score;
      _saveData();
    }
    _curScore = score;
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _bestScore = (prefs.getInt(_bestScoreKey) ?? 0);
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt(_bestScoreKey, _bestScore);
  }
}
