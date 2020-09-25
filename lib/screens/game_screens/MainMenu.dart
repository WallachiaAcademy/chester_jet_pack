import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/BasedTimedWidget.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenManager.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/Background.dart';
import 'package:chesterjetpack/screens/utils/Controller.dart';
import 'package:flutter/src/gestures/tap.dart';

class MainScreen extends BaseTimedWidget {
  Background _background;
  BaseWidget _startButton;
  BaseWidget _logo;

  MainScreen() {
    _background = Background('menu/Background.png');

    _startButton = Controller(0.35, 0.5, 0.3, 0.15, 'menu/start_btn.png');
    _logo = Controller(0.25, 0.15, 0.5, 0.3, 'menu/logo.png');
  }
  @override
  void render(Canvas canvas) {
    _background?.render(canvas);
    _startButton?.render(canvas);
    _logo?.render(canvas);
  }

  @override
  void resize(Size size) {
    _background?.resize(size);
    _startButton?.resize(size);
    _logo?.resize(size);
  }

  @override
  void update(double t) {
    _background?.update();
    _startButton?.update();
    _logo?.update();
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _startButton.onTapDown(detail, () {
      screenManager.switchScreen(ScreenState.kPlayScreen);
    });
  }
}
