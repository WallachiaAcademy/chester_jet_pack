import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../BasedTimedWidget.dart';

class Player extends BaseTimedWidget {
  AnimationComponent _player;

  Player() {
    List<Sprite> sprites =
        [1, 2, 3, 4].map((e) => Sprite('player/${e}.png')).toList();
    _player =
        AnimationComponent(0, 0, Animation.spriteList(sprites, stepTime: 0.1));
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _player.x = _player.x + 50;
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    _player.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Size size) {
    _player.x = 0;
    _player.y = (size.height - size.height * 0.25) / 2;
    _player.width = size.width * 0.15;
    _player.height = size.height * 0.25;
  }

  @override
  void update(double t) {
    _player.update(t);
  }
}
