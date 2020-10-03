import 'dart:math';
import 'dart:ui';

import 'package:chesterjetpack/screens/game/enemies/BaseEnemy.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class Rocket extends BaseEnemy {
  SpriteComponent _rocket;

  double _x;
  Size _size = Size(0, 0);
  bool _dead = false;

  Rocket() {
    _rocket = SpriteComponent.fromSprite(0, 0, Sprite('enemies/rocket.png'));
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {}

  @override
  void render(Canvas canvas) {
    canvas.save();
    _rocket.x = _x;
    _rocket.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Size size) {
    _size = size;

    _rocket.width = size.width * 0.12;
    _rocket.height = size.height * 0.08;
    Random r = Random();
    _rocket.y = size.height * 0.2 + size.height * 0.2 * r.nextInt(3);
    _x = size.width + _rocket.width;
  }

  @override
  void update(double t) {
    _x -= t * _size.width / 2;
  }

  @override
  bool isDead() {
    return _x < -_rocket.width || _dead;
  }

  @override
  void hit() {
    _dead = true;
  }

  @override
  bool overlaps(Rect rect) {
    return _rocket.toRect().overlaps(rect);
  }
}
