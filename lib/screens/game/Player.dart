import 'dart:ui';

import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../BaseWidget.dart';
import 'story/StoryHandler.dart';

class Player extends BaseWidget {
  AnimationComponent _player;
  AnimationComponent _smoke;
  double _speed;
  double _maxSpeed;
  double _y;

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
  void resize() {
    _y = (screenSize.height - screenSize.height * 0.25) / 2;
    _maxSpeed = screenSize.height * 0.005;

    _smoke.x = screenSize.width * 0.005;
    _smoke.width = screenSize.width * 0.15;
    _smoke.height = screenSize.height * 0.25;

    _player.x = screenSize.width * 0.1;
    _player.width = screenSize.width * 0.15;
    _player.height = screenSize.height * 0.25;
  }

  @override
  void update(double t) {
    _speed += t * _maxSpeed * 3;
    if (_speed > _maxSpeed) _speed = _maxSpeed;
    _y += _speed;

    // TODO: to be removed later
    if (_y > screenSize.height - _player.height)
      _y = screenSize.height - _player.height;
    if (_y < 0) _y = 0;

    _player.update(t);
    _smoke.update(t);

    var rect = _player.toRect();
    for (var e in storyHandler.entities) {
      if (e.overlaps(rect)) e.hit();
    }
  }
}
