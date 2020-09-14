import 'dart:async';
import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game_screens/PlayGround.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'MainMenu.dart';

ScreenManager screenManager = ScreenManager();

class ScreenManager extends Game with TapDetector {
  Function _fn;
  ScreenState _screenState;

  Size size = Size(0, 0);

  // Screens
  BaseWidget _mainScreen;
  BaseWidget _playScreen;

  ScreenManager() {
    _fn = _init;

    _screenState = ScreenState.kMenuScreen;
  }

  @override
  void resize(Size size) {
    this.size = size;
    _mainScreen?.resize(size);
  }

  @override
  void render(Canvas canvas) {
    _getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
    _fn();
  }

  Future<void> _init() async {
    _fn = _update;
    _mainScreen = MainScreen();
    _playScreen = PlayGround();

    Util flameUtils = Util();
    await flameUtils.fullScreen();
    await flameUtils.setOrientation(DeviceOrientation.landscapeLeft);
  }

  void _update() {
    _getActiveScreen()?.update();
  }

  void onTapDown(TapDownDetails details) {
    _getActiveScreen()?.onTapDown(details, () {});
  }

  BaseWidget _getActiveScreen() {
    switch (_screenState) {
      case ScreenState.kMenuScreen:
        return _mainScreen;
      case ScreenState.kPlayScreen:
        return _playScreen;
      default:
        return _mainScreen;
    }
  }

  void switchScreen(ScreenState newScreen) {
    switch (newScreen) {
      case ScreenState.kMenuScreen:
        _mainScreen = MainScreen();
        _mainScreen.resize(size);
        Timer(Duration(milliseconds: 100), () {
          _screenState = newScreen;
        });

        break;
      case ScreenState.kPlayScreen:
        _playScreen = PlayGround();
        _playScreen.resize(size);
        Timer(Duration(milliseconds: 100), () {
          _screenState = newScreen;
        });
        break;
    }
  }
}
