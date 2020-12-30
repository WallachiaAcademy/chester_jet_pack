import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../EntitiesSizes.dart';

class LifeTracker extends BaseWidget {
  int _lifeCount;
  double _gap;
  SpriteComponent _lifes;

  LifeTracker() {
    _lifeCount = 3;
    _gap = 0;
    _lifes = SpriteComponent.fromSprite(0, 0, Sprite('player/hp.png'));
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    for (int i = 0; i < _lifeCount; i++) {
      canvas.save();
      _lifes.x = screenSize.width - _gap * (i + 1);
      _lifes.render(canvas);
      canvas.restore();
    }
  }

  @override
  void resize() {
    _lifes.width = screenSize.width * kHpWidthRatio;
    _lifes.height = screenSize.height * kHpHeightRatio;
    _lifes.y = screenSize.height * kHpYAlignment;
    _gap = screenSize.width * kHpGapRatio;
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  void decreaseHp() {
    if (_lifeCount > 0) _lifeCount--;
  }

  bool isDead() {
    return _lifeCount <= 0;
  }

  void increaseHp() {
    if (_lifeCount < 5) _lifeCount++;
  }
}
