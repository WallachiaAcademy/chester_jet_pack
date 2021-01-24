import 'package:shared_preferences/shared_preferences.dart';

UserData userData = UserData();

class UserData {
  final String _bestScoreKey = "__best_score__";
  final String _playMusicKey = "__play_music__";

  int _bestScore = 0;
  int _curScore = 0;
  bool _shallPlayMusic = true;

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
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      _bestScore = (prefs.getInt(_bestScoreKey) ?? 0);
      _shallPlayMusic = (prefs.getBool(_playMusicKey) ?? true);
    } catch (Exception) {}
  }

  void _saveData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setInt(_bestScoreKey, _bestScore);
      prefs.setBool(_playMusicKey, _shallPlayMusic);
    } catch (Exception) {}
  }

  void toggleMusic() {
    _shallPlayMusic = !_shallPlayMusic;
    _saveData();
  }

  bool shallPlayMusic() => _shallPlayMusic;
}
