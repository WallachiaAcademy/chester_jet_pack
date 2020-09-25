import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class Rocket extends BaseWidget {
  SpriteComponent _rocket;

  double _x;

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
    _x = size.width + _rocket.width;
    _rocket.y = size.height / 2;
  }

  @override
  void update() {}
}
