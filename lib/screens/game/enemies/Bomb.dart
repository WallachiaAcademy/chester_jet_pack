import 'dart:ui';

import 'package:chesterjetpack/audio/SoundsHandler.dart';
import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/entities/DoubleAnimatedEntity.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
import 'package:flutter/src/gestures/tap.dart';

class Bomb extends DoubleAnimatedEntity {
  Bomb(List<double> args)
      : super(
          'enemies/bomb/bomb',
          2,
          0.5,
          'common/',
          5,
          0.2,
          args,
        );

  @override
  void hit(BasePlayer player) {
    if (!super.isDeadOngoing()) {
      soundsHandler.playExplosion();
      super.hitSuper();
      player.hit();
    }
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
    super.superResize(
      fWR: kBombWidthRatio,
      fHR: kBombHeightRatio,
      sWR: kExplosionWidthRatio,
      sHR: kExplosionHeightRatio,
    );
  }

  @override
  void update(double t) {
    updateSuper(t);
  }
}
