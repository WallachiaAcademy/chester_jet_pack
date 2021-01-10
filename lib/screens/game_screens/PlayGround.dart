import 'dart:ui';

import 'package:chesterjetpack/audio/SoundsHandler.dart';
import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/data/UserData.dart';
import 'package:chesterjetpack/screens/game/player/Player.dart';
import 'package:chesterjetpack/screens/game/story/StoryHandler.dart';
import 'package:chesterjetpack/screens/game_screens/PauseWidget.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenManager.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/Controller.dart';
import 'package:chesterjetpack/screens/utils/DynamicBackground.dart';
import 'package:chesterjetpack/screens/utils/RepetitiveAsset.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../BaseWidget.dart';

class PlayGround extends BaseWidget {
  BaseWidget _bg;
  BaseWidget _topBorder;
  BaseWidget _botBorder;

  Player _player;

  BaseWidget _pauseButton;
  BaseWidget _pauseWidget;
  bool _isGamePaused = false;

  BaseWidget _musicOff;
  BaseWidget _musicOn;

  bool _isGameOver = false;

  PlayGround() {
    _bg = DynamicBackground(0.2, 'play_ground/background.png');
    _topBorder = RepetitiveAsset(
      kBarHeightRatio,
      kBarTopYRatio,
      kBarSpeed,
      'play_ground/border.png',
    );
    _botBorder = RepetitiveAsset(
      kBarHeightRatio,
      kBarBottomYRatio,
      kBarSpeed,
      'play_ground/border.png',
    );
    _player = Player();

    _pauseButton =
        Controller(0.02, 0.03, 0.06, 0.1, 'play_ground/pause_button.png');
    _musicOff = Controller(0.1, 0.03, 0.06, 0.1, 'play_ground/sound_off.png');
    _musicOn = Controller(0.1, 0.03, 0.06, 0.1, 'play_ground/sound_on.png');
    _pauseWidget = PauseWidget(() {
      _isGamePaused = false;
    }, () {
      _isGamePaused = false;
      _gameOver();
    });
    storyHandler.reset();
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    bool musicToggled = false;
    _pauseButton.onTapDown(detail, () {
      _isGamePaused = true;
    });

    if (!_isGamePaused) {
      _musicOff.onTapDown(detail, () {
        userData.toggleMusic();
        soundsHandler.update();
        musicToggled = true;
      });
      if (!musicToggled) {
        _player.onTapDown(detail, () {});
        storyHandler.onTapDown(detail, fn);
      }
    } else {
      _pauseWidget.onTapDown(detail, () {});
    }
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    storyHandler.render(canvas);
    _topBorder.render(canvas);
    _botBorder.render(canvas);
    _player.render(canvas);
    _pauseButton.render(canvas);
    if (_isGamePaused) _pauseWidget.render(canvas);

    if (userData.shallPlayMusic())
      _musicOn.render(canvas);
    else
      _musicOff.render(canvas);
  }

  @override
  void resize() {
    _bg.resize();
    _topBorder.resize();
    _botBorder.resize();
    _player.resize();
    _pauseButton.resize();
    _pauseWidget.resize();
    _musicOff.resize();
    _musicOn.resize();
    storyHandler.resize();
  }

  @override
  void update(double t) {
    if (!_isGameOver && !_isGamePaused) {
      _bg.update(t);
      _player.update(t);
      _topBorder.update(t);
      _botBorder.update(t);
      storyHandler.update(t);

      if (_player.isDead()) {
        _gameOver();
      }
    }
  }

  void _gameOver() {
    userData.setScore(_player.getScore());
    _isGameOver = true;
    screenManager.switchScreen(ScreenState.kScoreScreen);
  }
}
