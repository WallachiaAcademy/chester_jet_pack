import 'dart:ui';

import 'package:chesterjetpack/audio/SoundsHandler.dart';
import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/entities/DoubleAnimatedEntity.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
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
      fWR: kRocketWidthRatio,
      fHR: kRocketHeightRatio,
      sWR: kExplosionWidthRatio,
      sHR: kExplosionHeightRatio,
    );
  }

  @override
  void update(double t) {
    super.updateSuper(t, normalFact: 1, dyingFactor: 4);
  }

  @override
  bool isDead() {
    return super.isDeadSuper();
  }

  @override
  void hit(BasePlayer player) {
    if (!super.isDeadOngoing()) {
      soundsHandler.playExplosion();
      super.hitSuper();
      player.hit();
    }
  }

  @override
  bool overlaps(Rect rect) {
    return super.overlapsSuper(rect);
  }
}
