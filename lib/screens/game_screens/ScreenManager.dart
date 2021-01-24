import 'dart:async';
import 'dart:ui';

import 'package:chesterjetpack/ads/AdsManager.dart';
import 'package:chesterjetpack/audio/SoundsHandler.dart';
import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game/data/UserData.dart';
import 'package:chesterjetpack/screens/game_screens/LoadingScreen.dart';
import 'package:chesterjetpack/screens/game_screens/PlayGround.dart';
import 'package:chesterjetpack/screens/game_screens/ScoreScreen.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/flame.dart';
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
  BaseWidget _loadingScreen;
  BaseWidget _mainScreen;
  BaseWidget _playScreen;
  BaseWidget _scoreScreen;

  ScreenManager() {
    _fn = _init;

    _screenState = ScreenState.kLoadingScreen;
  }

  @override
  void resize(Size size) {
    screenSize = size;
    _loadingScreen?.resize();
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
    _loadingScreen = LoadingScreen();

    Util flameUtils = Util();
    await flameUtils.fullScreen();
    await flameUtils.setOrientation(DeviceOrientation.landscapeLeft);

    userData.loadData();
    await loadAssets();

    switchScreen(ScreenState.kMenuScreen);
  }

  Future<void> loadAssets() async {
    await Flame.images.loadAll(<String>[
      'common/0.png',
      'common/1.png',
      'common/2.png',
      'common/3.png',
      'common/4.png',
      'enemies/bomb/bomb0.png',
      'enemies/bomb/bomb1.png',
      'enemies/electric_obstacle/0.png',
      'enemies/electric_obstacle/1.png',
      'enemies/electric_obstacle/2.png',
      'enemies/electric_obstacle/3.png',
      'enemies/rocket/rocket0.png',
      'menu/Background.png',
      'menu/FshareBtn.png',
      'menu/logo.png',
      'menu/start_btn.png',
      'player/1.png',
      'player/2.png',
      'player/3.png',
      'player/4.png',
      'player/hp.png',
      'player/s1.png',
      'player/s2.png',
      'player/s3.png',
      'player/s4.png',
      'play_ground/background.png',
      'play_ground/border.png',
      'play_ground/pause_widget/bg.png',
      'play_ground/pause_button.png',
      'play_ground/sound_off.png',
      'play_ground/sound_on.png',
      'play_ground/pause_widget/resume_button.png',
      'play_ground/pause_widget/surrender_button.png',
      'rewards/coin0.png',
      'rewards/coin1.png',
      'rewards/coin2.png',
      'rewards/coin3.png',
      'rewards/coin4.png',
      'rewards/coin5.png',
      'rewards/hp0.png',
      'rewards/hp1.png',
      'score/Background.png',
      'score/exit_to_menu.png',
      'score/play_again.png',
      'stage/bottom_pillar_back.png',
      'stage/bottom_pillar_front.png',
      'stage/metal_box.png',
      'stage/spikes.png',
      'stage/top_pillar_back.png',
      'stage/top_pillar_front.png',
      'stage/wood_box.png',
    ]);

    await Flame.audio.loadAll(['explosion.ogg']);
    await Flame.audio.loadAll(['background_music.mp3']);

    soundsHandler.update();
    AdsManager.instance.cacheAd();
  }

  void _update(double t) {
    _getActiveScreen()?.update(t);
  }

  void onTapDown(TapDownDetails details) {
    _getActiveScreen()?.onTapDown(details, () {});
  }

  BaseWidget _getActiveScreen() {
    switch (_screenState) {
      case ScreenState.kLoadingScreen:
        return _loadingScreen;
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
      case ScreenState.kLoadingScreen:
        _loadingScreen = LoadingScreen();
        _loadingScreen.resize();
        _screenState = newScreen;
        break;
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

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed)
      soundsHandler.resume();
    else if (state == AppLifecycleState.paused) soundsHandler.pause();
  }
}
