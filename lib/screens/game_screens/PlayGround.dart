import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/BasedTimedWidget.dart';
import 'package:chesterjetpack/screens/game/Player.dart';
import 'package:chesterjetpack/screens/game/Rocket.dart';
import 'package:chesterjetpack/screens/utils/DynamicBackground.dart';
import 'package:flutter/src/gestures/tap.dart';

class PlayGround extends BaseTimedWidget {
  BaseWidget _bg;
  Player _player;
  Rocket _rocket;
  PlayGround() {
    _bg = DynamicBackground(5, 'play_ground/background.png');
    _player = Player();
    _rocket = Rocket();
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _player.onTapDown(detail, () {});
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    _rocket.render(canvas);
    _player.render(canvas);
  }

  @override
  void resize(Size size) {
    _bg.resize(size);
    _rocket.resize(size);
    _player.resize(size);
  }

  @override
  void update(double t) {
    _rocket.update(t);
    _player.update(t);
    _bg.update();
  }
}
