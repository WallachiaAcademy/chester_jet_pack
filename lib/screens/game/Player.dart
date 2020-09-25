import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../BasedTimedWidget.dart';

class Player extends BaseTimedWidget {
  AnimationComponent _player;
  AnimationComponent _smoke;
  double _speed;
  double _maxSpeed;
  double _y;
  Size _size;

  Player() {
    List<Sprite> sprites =
        [1, 2, 3, 4].map((e) => Sprite('player/${e}.png')).toList();
    _player =
        AnimationComponent(0, 0, Animation.spriteList(sprites, stepTime: 0.1));

    sprites = [1, 2, 3, 4].map((e) => Sprite('player/s${e}.png')).toList();
    _smoke =
        AnimationComponent(0, 0, Animation.spriteList(sprites, stepTime: 0.1));

    _speed = 0;
    _maxSpeed = 0;
    _y = 0;
    _size = Size(0, 0);
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _speed = -_maxSpeed * 2;
  }

  @override
  void render(Canvas canvas) {
    if (_speed < _maxSpeed) {
      canvas.save();
      _smoke.y = _y + _player.height * 0.5;
      _smoke.render(canvas);
      canvas.restore();
    }
    canvas.save();
    _player.y = _y;
    _player.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Size size) {
    _size = size;
    _y = (size.height - size.height * 0.25) / 2;
    _maxSpeed = size.height * 0.005;

    _smoke.x = _size.width * 0.005;
    _smoke.width = size.width * 0.15;
    _smoke.height = size.height * 0.25;

    _player.x = _size.width * 0.1;
    _player.width = size.width * 0.15;
    _player.height = size.height * 0.25;
  }

  @override
  void update(double t) {
    _speed += t * _maxSpeed * 3;
    if (_speed > _maxSpeed) _speed = _maxSpeed;
    _y += _speed;

    // TODO: to be removed later
    if (_y > _size.height - _player.height) _y = _size.height - _player.height;
    if (_y < 0) _y = 0;

    _player.update(t);
    _smoke.update(t);
  }
}
