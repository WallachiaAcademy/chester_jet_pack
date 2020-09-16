import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class DynamicBackground extends BaseWidget {
  final double _speed;

  SpriteComponent _bg;

  Function _fn;
  DateTime _lastUpdated;
  double _x;

  Size _size;

  DynamicBackground(this._speed, String imgSrc) {
    _bg = SpriteComponent.fromSprite(0, 0, Sprite(imgSrc));
    _fn = _init;
    _x = 0;
    _size = Size(0, 0);
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    _bg.x = _x + _size.width * 0.995;
    _bg.render(canvas);
    canvas.restore();

    canvas.save();
    _bg.x = _x;
    _bg.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Size size) {
    this._size = size;
    _bg.width = size.width;
    _bg.height = size.height;
  }

  @override
  void update() {
    _fn();
  }

  void _init() {
    _fn = _update;
    _lastUpdated = DateTime.now();
  }

  void _update() {
    _x -= DateTime.now().difference(_lastUpdated).inMilliseconds *
        _size.width /
        (1000 * _speed);
    if (_x < -_size.width * 0.995) _x += _size.width * 0.995;
    _lastUpdated = DateTime.now();
  }
}
