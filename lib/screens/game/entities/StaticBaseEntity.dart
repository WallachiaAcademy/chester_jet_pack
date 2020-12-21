import 'dart:ui';

import 'package:chesterjetpack/screens/game/entities/BaseEntity.dart';
import 'package:chesterjetpack/screens/game/entities/EntityState.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';

abstract class StaticBaseEntity extends BaseEntity {
  SpriteComponent _component;

  double _x;
  double _yRatio;

  EntityState _state;
  StaticBaseEntity(String spriteSource, List<double> args) {
    _component = SpriteComponent.fromSprite(0, 0, Sprite(spriteSource));

    _x = 0;
    _yRatio = args[0];
    _state = EntityState.Normal;
  }

  @mustCallSuper
  bool overlapsSuper(Rect rect) {
    return _component.toRect().overlaps(rect);
  }

  @mustCallSuper
  void renderSuper(Canvas canvas) {
    canvas.save();

    _component.x = _x;
    _component.render(canvas);

    canvas.restore();
  }

  @mustCallSuper
  void resizeSuper({
    double wR = 0,
    double hR = 0,
  }) {
    _component.width = screenSize.width * wR;
    _component.height = screenSize.height * hR;
    _component.y = screenSize.height * _yRatio;

    _x = screenSize.width;
  }

  @mustCallSuper
  void updateSuper(double t, {double normalFact = 2}) {
    _x -= t * screenSize.width / normalFact;
    if (_x + _component.width * 2 < 0) {
      _state = EntityState.Dead;
    }
  }

  @mustCallSuper
  bool isDeadSuper() {
    return _state == EntityState.Dead;
  }

  void die() {
    _state = EntityState.Dead;
  }

  @override
  Rect getSurface() {
    return _component.toRect();
  }
}
