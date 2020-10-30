import 'dart:ui';

import 'package:chesterjetpack/screens/game/entities/DoubleAnimatedEntity.dart';
import 'package:flutter/src/gestures/tap.dart';

class Rocket extends DoubleAnimatedEntity {
  Rocket(List<double> args)
      : super(
          'enemies/rocket/rocket',
          1,
          0.2,
          'common/',
          5,
          0.2,
          args,
        );

  @override
  void onTapDown(TapDownDetails detail, Function fn) {}

  @override
  void render(Canvas canvas) {
    super.renderSuper(canvas);
  }

  @override
  void resize() {
    super.superResize(
      fWR: 0.1,
      fHR: 0.06,
      sWR: 0.14,
      sHR: 0.24,
    );
  }

  @override
  void update(double t) {
    super.updateSuper(t, normalFact: 2, dyingFactor: 4);
  }

  @override
  bool isDead() {
    return super.isDeadSuper();
  }

  @override
  void hit() {
    super.hitSuper();
  }

  @override
  bool overlaps(Rect rect) {
    return super.overlapsSuper(rect);
  }
}
