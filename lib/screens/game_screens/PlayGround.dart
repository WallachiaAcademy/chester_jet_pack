import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/BasedTimedWidget.dart';
import 'package:chesterjetpack/screens/game/Player.dart';
import 'package:chesterjetpack/screens/game/enemies/EnemiesFactory.dart';
import 'package:chesterjetpack/screens/utils/DynamicBackground.dart';
import 'package:flutter/src/gestures/tap.dart';

class PlayGround extends BaseTimedWidget {
  BaseWidget _bg;
  Player _player;
  PlayGround() {
    _bg = DynamicBackground(5, 'play_ground/background.png');
    _player = Player();
    enemiesFactory.reset();
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _player.onTapDown(detail, () {});
    enemiesFactory.onTapDown(detail, fn);
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    _player.render(canvas);
    enemiesFactory.render(canvas);
  }

  @override
  void resize(Size size) {
    _bg.resize(size);
    _player.resize(size);
    enemiesFactory.resize(size);
  }

  @override
  void update(double t) {
    _player.update(t);
    _bg.update();
    enemiesFactory.update(t);
  }
}
