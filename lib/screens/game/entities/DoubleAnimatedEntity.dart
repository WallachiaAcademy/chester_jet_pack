import 'dart:ui';

import 'package:chesterjetpack/screens/game/entities/BaseEntity.dart';
import 'package:chesterjetpack/screens/game/entities/EntityState.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';

abstract class DoubleAnimatedEntity extends BaseEntity {
  AnimationComponent _first;
  AnimationComponent _second;

  EntityState _entityState;

  double _x;
  double _yRatio;
  double _xGap = 0;

  DoubleAnimatedEntity(
    String firstAniPath,
    int firstAniCount,
    double firstAniSpeed,
    String secondAniPath,
    int secondAniCount,
    double secondAniSpeed,
    List<double> args,
  ) {
    List<Sprite> _sprites = List<Sprite>();

    for (int i = 0; i < firstAniCount; i++) {
      _sprites.add(Sprite('$firstAniPath$i.png'));
    }
    _first = AnimationComponent(
        0, 0, Animation.spriteList(_sprites, stepTime: firstAniSpeed));
    _sprites.clear();
    for (int i = 0; i < secondAniCount; i++) {
      _sprites.add(Sprite('$secondAniPath$i.png'));
    }

    _second = AnimationComponent(0, 0,
        Animation.spriteList(_sprites, stepTime: secondAniSpeed, loop: false));

    _entityState = EntityState.Normal;
    _x = 0;
    _yRatio = args[0];
  }

  @mustCallSuper
  bool overlapsSuper(Rect rect) {
    if (_entityState == EntityState.Normal)
      return _first.toRect().overlaps(rect);
    else
      return _second.toRect().overlaps(rect);
  }

  @mustCallSuper
  void renderSuper(Canvas canvas) {
    canvas.save();
    if (_entityState == EntityState.Normal) {
      _first.x = _x;
      _first.render(canvas);
    } else {
      _second.x = _x + _xGap;
      _second.render(canvas);
    }
    canvas.restore();
  }

  @mustCallSuper
  void superResize({
    double fWR = 0,
    double fHR = 0,
    double sWR = 0,
    double sHR = 0,
  }) {
    _first.width = screenSize.width * fWR;
    _first.height = screenSize.height * fHR;
    _first.y = screenSize.height * _yRatio;

    _second.width = screenSize.width * sWR;
    _second.height = screenSize.height * sHR;
    _second.y =
        screenSize.height * _yRatio + (_first.height - _second.height) / 2;
    ;

    _x = screenSize.width;
    _xGap = (_first.width - _second.width) / 2;
  }

  @mustCallSuper
  void updateSuper(double t, {double normalFact = 2, double dyingFactor = 4}) {
    var width = 0.0;
    if (_entityState == EntityState.Normal) {
      _x -= t * screenSize.width / normalFact;
      _first.update(t);
      width = _first.width;
    } else {
      _x -= t * screenSize.width / dyingFactor;
      _second.update(t);
      width = _second.width;

      if (_second.animation.done()) {
        _second.animation.reversed(); // safety measure
        _entityState = EntityState.Dead;
      }
    }
    if (_x + width * 2 < 0) {
      _entityState = EntityState.Dead;
    }
  }

  @mustCallSuper
  bool isDeadSuper() {
    return _entityState == EntityState.Dead;
  }

  bool isDeadOngoing() {
    return _entityState == EntityState.Dying;
  }

  @mustCallSuper
  void hitSuper() {
    _entityState = EntityState.Dying;
  }

  @override
  Rect getSurface() {
    return _first.toRect();
  }
}
