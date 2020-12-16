import 'dart:ui';

import 'package:chesterjetpack/screens/game/entities/AnimatedEntity.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../EntitiesSizes.dart';

class ElectricObstacle extends AnimatedEntity {
  ElectricObstacle(List<double> args)
      : super(
          'enemies/electric_obstacle/',
          4,
          0.2,
          args,
        );

  @override
  void hit(BasePlayer player) {
    player.hit();
  }

  @override
  bool isDead() {
    return super.isDeadSuper();
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  bool overlaps(Rect rect) {
    return super.overlapsSuper(rect);
  }

  @override
  void render(Canvas canvas) {
    super.renderSuper(canvas);
  }

  @override
  void resize() {
    super.resizeSuper(
      wR: kElectricObstacleWR,
      hR: kElectricObstacleHR,
    );
  }

  @override
  void update(double t) {
    super.updateSuper(t);
  }
}
