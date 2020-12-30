import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenManager.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/Background.dart';
import 'package:chesterjetpack/screens/utils/Controller.dart';
import 'package:flutter/src/gestures/tap.dart';

class MainScreen extends BaseWidget {
  Background _background;
  BaseWidget _startButton;
  BaseWidget _logo;

  MainScreen() {
    _background = Background('menu/Background.png');

    _startButton = Controller(0.35, 0.7, 0.3, 0.15, 'menu/start_btn.png');
    _logo = Controller(0.25, 0.1, 0.5, 0.5, 'menu/logo.png');
  }
  @override
  void render(Canvas canvas) {
    _background?.render(canvas);
    _startButton?.render(canvas);
    _logo?.render(canvas);
  }

  @override
  void resize() {
    _background?.resize();
    _startButton?.resize();
    _logo?.resize();
  }

  @override
  void update(double t) {
    _background?.update(t);
    _startButton?.update(t);
    _logo?.update(t);
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _startButton.onTapDown(detail, () {
      screenManager.switchScreen(ScreenState.kPlayScreen);
    });
  }
}
