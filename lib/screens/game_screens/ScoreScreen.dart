import 'dart:ui';

import 'package:chesterjetpack/ads/AdsManager.dart';
import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/data/UserData.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenManager.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/Background.dart';
import 'package:chesterjetpack/screens/utils/Controller.dart';
import 'package:chesterjetpack/screens/utils/StaticText.dart';
import 'package:flutter/src/gestures/tap.dart';

class ScoreScreen extends BaseWidget {
  BaseWidget _bg;
  BaseWidget _menu;
  BaseWidget _playAgain;

  StaticText _currentScore;
  StaticText _bestScore;

  ScoreScreen() {
    _bg = new Background('score/Background.png');
    _playAgain = new Controller(0.15, 0.6, 0.3, 0.15, 'score/play_again.png');
    _menu = new Controller(0.55, 0.6, 0.3, 0.15, 'score/exit_to_menu.png');

    _currentScore = StaticText(Color(0xFFFFCC00), Color(0xFF000000),
        kScoreScreenFontRatio, 0.5, 0.2, TextAnchor.Center);
    _bestScore = StaticText(Color(0xFFFFCC00), Color(0xFF000000),
        kScoreScreenFontRatio, 0.5, 0.4, TextAnchor.Center);

    _currentScore.update("CURRENT SCORE: " + userData.getCurScore().toString());
    _bestScore.update("BEST SCORE: " + userData.getBestScore().toString());
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _menu.onTapDown(detail, () {
      AdsManager.instance.playNewAd(() {
        screenManager.switchScreen(ScreenState.kMenuScreen);
      });
    });

    _playAgain.onTapDown(detail, () {
      AdsManager.instance.playNewAd(() {
        screenManager.switchScreen(ScreenState.kPlayScreen);
      });
    });
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    _menu.render(canvas);
    _playAgain.render(canvas);

    _bestScore.render(canvas);
    _currentScore.render(canvas);
  }

  @override
  void resize() {
    _bg.resize();
    _menu.resize();
    _playAgain.resize();
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
