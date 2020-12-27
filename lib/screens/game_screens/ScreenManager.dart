import 'dart:async';
import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game/data/UserData.dart';
import 'package:chesterjetpack/screens/game_screens/PlayGround.dart';
import 'package:chesterjetpack/screens/game_screens/ScoreScreen.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
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

  // Screens
  BaseWidget _mainScreen;
  BaseWidget _playScreen;
  BaseWidget _scoreScreen;

  ScreenManager() {
    _fn = _init;

    _screenState = ScreenState.kMenuScreen;
  }

  @override
  void resize(Size size) {
    screenSize = size;
    _mainScreen?.resize();
  }

  @override
  void render(Canvas canvas) {
    _getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
    _fn(t);
  }

  Future<void> _init(double t) async {
    _fn = _update;
    _mainScreen = MainScreen();
    _playScreen = PlayGround();
    _scoreScreen = ScoreScreen();

    Util flameUtils = Util();
    await flameUtils.fullScreen();
    await flameUtils.setOrientation(DeviceOrientation.landscapeLeft);

    userData.loadData();
  }

  void _update(double t) {
    _getActiveScreen()?.update(t);
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
      case ScreenState.kScoreScreen:
        return _scoreScreen;
      default:
        return _mainScreen;
    }
  }

  void switchScreen(ScreenState newScreen) {
    switch (newScreen) {
      case ScreenState.kMenuScreen:
        _mainScreen = MainScreen();
        _mainScreen.resize();
        Timer(Duration(milliseconds: 100), () {
          _screenState = newScreen;
        });

        break;
      case ScreenState.kPlayScreen:
        _playScreen = PlayGround();
        _playScreen.resize();
        Timer(Duration(milliseconds: 100), () {
          _screenState = newScreen;
        });
        break;
      case ScreenState.kScoreScreen:
        _scoreScreen = ScoreScreen();
        _scoreScreen.resize();

        Timer(Duration(milliseconds: 500), () {
          _screenState = newScreen;
        });
    }
  }
}
