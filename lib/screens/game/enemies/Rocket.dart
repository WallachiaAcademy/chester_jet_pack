import 'dart:math';
import 'dart:ui';

import 'package:chesterjetpack/screens/game/BaseEntity.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class Rocket extends BaseEntity {
  SpriteComponent _rocket;

  double _x;
  Size _size = Size(0, 0);

  List<SpriteComponent> _explosion;

  bool _dead = false;
  bool _deadOnGoing = false;
  double _deadTime = 0;

  Rocket() {
    _rocket =
        SpriteComponent.fromSprite(0, 0, Sprite('enemies/rocket/rocket.png'));

    _explosion = List<SpriteComponent>();
    for (int i = 0; i < 5; i++) {
      _explosion.add(SpriteComponent.fromSprite(
          0, 0, Sprite('enemies/rocket/' + i.toString() + '.png')));
    }
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {}

  @override
  void render(Canvas canvas) {
    canvas.save();
    if (_deadOnGoing) {
      int idx = _deadTime.toInt();
      var curExpAni = _explosion.elementAt(idx);
      curExpAni.x = _x - curExpAni.width / 2;
      curExpAni.render(canvas);
    } else {
      _rocket.x = _x;
      _rocket.render(canvas);
    }
    canvas.restore();
  }

  @override
  void resize(Size size) {
    Random r = Random();
    _size = size;

    _rocket.width = size.width * 0.1;
    _rocket.height = size.height * 0.06;
    _x = size.width + _rocket.width;
    _rocket.y = size.height * 0.2 + size.height * 0.2 * r.nextInt(3);

    for (var a in _explosion) {
      a.width = size.width * 0.14;
      a.height = size.height * 0.24;
      a.y = (_rocket.y + _rocket.height / 2) - a.height / 2;
    }
  }

  @override
  void update(double t) {
    if (_deadOnGoing) {
      _x -= t * _size.width / 4;
      _deadTime += t * 10;
      if (_deadTime >= 5) {
        _dead = true;
        _deadTime = 4;
      }
    } else {
      _x -= t * _size.width / 2;
    }
  }

  @override
  bool isDead() {
    return _x < -_rocket.width || _dead;
  }

  @override
  void hit() {
    _deadOnGoing = true;
  }

  @override
  bool overlaps(Rect rect) {
    return _rocket.toRect().overlaps(rect);
  }
}
