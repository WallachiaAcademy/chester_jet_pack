import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import 'SizeHolder.dart';

class Background extends BaseWidget {
  SpriteComponent _bgSprite;

  Background(String src) {
    _bgSprite = SpriteComponent.fromSprite(0, 0, Sprite(src));
  }

  @override
  void render(Canvas canvas) {
    _bgSprite.render(canvas);
  }

  @override
  void resize() {
    _bgSprite.width = screenSize.width;
    _bgSprite.height = screenSize.height;
  }

  @override
  void update(double t) {}

  @override
  void onTapDown(TapDownDetails detail, Function fn) {}
}
