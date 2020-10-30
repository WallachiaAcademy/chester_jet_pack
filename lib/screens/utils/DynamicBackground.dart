import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import 'SizeHolder.dart';

class DynamicBackground extends BaseWidget {
  final double _speed;

  SpriteComponent _bg;
  double _x;

  DynamicBackground(this._speed, String imgSrc) {
    _bg = SpriteComponent.fromSprite(0, 0, Sprite(imgSrc));
    _x = 0;
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    _bg.x = _x + screenSize.width * 0.995;
    _bg.render(canvas);
    canvas.restore();

    canvas.save();
    _bg.x = _x;
    _bg.render(canvas);
    canvas.restore();
  }

  @override
  void resize() {
    _bg.width = screenSize.width;
    _bg.height = screenSize.height;
  }

  @override
  void update(double t) {
    _x -= t * _speed * screenSize.width;
    if (_x < -screenSize.width * 0.995) _x += screenSize.width * 0.995;
  }
}
