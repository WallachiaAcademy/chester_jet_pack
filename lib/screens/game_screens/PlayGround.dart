import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/data/UserData.dart';
import 'package:chesterjetpack/screens/game/player/Player.dart';
import 'package:chesterjetpack/screens/game/story/StoryHandler.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenManager.dart';
import 'package:chesterjetpack/screens/game_screens/ScreenState.dart';
import 'package:chesterjetpack/screens/utils/DynamicBackground.dart';
import 'package:chesterjetpack/screens/utils/RepetitiveAsset.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../BaseWidget.dart';

class PlayGround extends BaseWidget {
  BaseWidget _bg;
  BaseWidget _topBorder;
  BaseWidget _botBorder;

  Player _player;

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
    storyHandler.reset();
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _player.onTapDown(detail, () {});
    storyHandler.onTapDown(detail, fn);
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    storyHandler.render(canvas);
    _topBorder.render(canvas);
    _botBorder.render(canvas);
    _player.render(canvas);
  }

  @override
  void resize() {
    _bg.resize();
    _topBorder.resize();
    _botBorder.resize();
    _player.resize();
    storyHandler.resize();
  }

  @override
  void update(double t) {
    if (!_isGameOver) {
      _bg.update(t);
      _player.update(t);
      _topBorder.update(t);
      _botBorder.update(t);
      storyHandler.update(t);

      if (_player.isDead()) {
        userData.setScore(_player.getScore());
        _isGameOver = true;
        screenManager.switchScreen(ScreenState.kScoreScreen);
      }
    }
  }
}
