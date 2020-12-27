import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenManager.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/Background.dart';
import 'package:chesterjetpack/screens/utils/Controller.dart';
import 'package:flutter/src/gestures/tap.dart';

class ScoreScreen extends BaseWidget {
  BaseWidget _bg;
  BaseWidget _menu;
  BaseWidget _playAgain;
  ScoreScreen() {
    _bg = new Background('score/Background.png');
    _playAgain = new Controller(0.15, 0.5, 0.3, 0.15, 'score/play_again.png');
    _menu = new Controller(0.55, 0.5, 0.3, 0.15, 'score/exit_to_menu.png');
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _menu.onTapDown(detail, () {
      screenManager.switchScreen(ScreenState.kMenuScreen);
    });

    _playAgain.onTapDown(detail, () {
      screenManager.switchScreen(ScreenState.kPlayScreen);
    });
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    _menu.render(canvas);
    _playAgain.render(canvas);
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
