import 'dart:ui';

import 'package:chesterjetpack/screens/game/entities/BaseEntity.dart';
import 'package:chesterjetpack/screens/game/entities/EntityState.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';

abstract class AnimatedEntity extends BaseEntity {
  AnimationComponent _animation;

  double _x;
  double _yRatio;

  EntityState _state;

  AnimatedEntity(
    String aniPath,
    int aniCount,
    double aniSpeed,
    List<double> args,
  ) {
    List<Sprite> _sprites = List<Sprite>();

    for (int i = 0; i < aniCount; i++) {
      _sprites.add(Sprite('$aniPath$i.png'));
    }
    _animation = AnimationComponent(
        0, 0, Animation.spriteList(_sprites, stepTime: aniSpeed));

    _x = 0;
    _yRatio = args[0];
    _state = EntityState.Normal;
  }

  @mustCallSuper
  bool overlapsSuper(Rect rect) {
    return _animation.toRect().overlaps(rect);
  }

  @mustCallSuper
  void renderSuper(Canvas canvas) {
    canvas.save();

    _animation.x = _x;
    _animation.render(canvas);

    canvas.restore();
  }

  @mustCallSuper
  void resizeSuper({
    double wR = 0,
    double hR = 0,
  }) {
    _animation.width = screenSize.width * wR;
    _animation.height = screenSize.height * hR;
    _animation.y = screenSize.height * _yRatio;

    _x = screenSize.width;
  }

  @mustCallSuper
  void updateSuper(double t, {double normalFact = 2}) {
    _x -= t * screenSize.width / normalFact;
    _animation.update(t);
    if (_x + _animation.width * 2 < 0) {
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
    return _animation.toRect();
  }
}
