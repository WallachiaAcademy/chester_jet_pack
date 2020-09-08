import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/game/game.dart';

import 'MainMenu.dart';

ScreenManager screenManager = ScreenManager();

class ScreenManager extends Game {
  Function _fn;

  Size size = Size(0, 0);

  ScreenManager() {
    _fn = _init;
  }

  BaseWidget _mainScreen;
  @override
  void resize(Size size) {
    this.size = size;
    _mainScreen?.resize(size);
  }

  @override
  void render(Canvas canvas) {
    _mainScreen?.render(canvas);
  }

  @override
  void update(double t) {
    _fn();
  }

  void _init() {
    _fn = _update;
    _mainScreen = new MainScreen();
  }

  void _update() {
    _mainScreen?.update();
  }
}
