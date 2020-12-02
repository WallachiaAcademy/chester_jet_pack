import 'dart:ui';

import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/entities/BaseEntity.dart';
import 'package:chesterjetpack/screens/game/entities/EntityState.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class TopPillar extends Pillar {
  TopPillar(List<double> args) : super('top', args);
}

class BottomPillar extends Pillar {
  BottomPillar(List<double> args) : super('bottom', args);
}

class Pillar extends BaseEntity {
  SpriteComponent _front;
  SpriteComponent _back;

  double _x;
  double _yRatio;

  EntityState _state;
  Pillar(String side, List<double> args) {
    _front = SpriteComponent.fromSprite(
        0, 0, Sprite('stage/' + side + '_pillar_front.png'));
    _back = SpriteComponent.fromSprite(
        0, 0, Sprite('stage/' + side + '_pillar_back.png'));

    _x = 0;
    _yRatio = args[0];
    _state = EntityState.Normal;
  }

  @override
  bool overlaps(Rect rect) {
    return _front.toRect().overlaps(rect);
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    _back.x = _x - _back.width / 2;
    _back.render(canvas);
    canvas.restore();

    canvas.save();
    _front.x = _x - _front.width / 2;
    _front.render(canvas);
    canvas.restore();
  }

  @override
  void resize() {
    _front.width = screenSize.width * kPillarWidthRatio;
    _front.height = screenSize.height * kPillarHeightRatio;
    _front.y = screenSize.height * _yRatio - _front.height / 2;

    _back.width = screenSize.width * kPillarWidthRatio;
    _back.height = screenSize.height * kPillarHeightRatio;
    _back.y = screenSize.height * _yRatio - _back.height / 2;

    _x = screenSize.width + _front.width;
  }

  @override
  void update(double t, {double normalFact = 2}) {
    _x -= t * screenSize.width / normalFact;
    if (_x + _front.width < 0) {
      _state = EntityState.Dead;
    }
  }

  @override
  bool isDead() {
    return _state == EntityState.Dead;
  }

  double getX() => _x;

  @override
  void hit(BasePlayer player) {
    player.pushBack(_x);
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }
}
