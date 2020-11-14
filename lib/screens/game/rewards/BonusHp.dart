import 'dart:ui';

import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/entities/AnimatedEntity.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
import 'package:flutter/src/gestures/tap.dart';

class BonusHp extends AnimatedEntity {
  BonusHp(List<double> args) : super('rewards/hp', 2, 0.5, args);

  @override
  void hit(BasePlayer player) {
    player.increaseHp();
    super.die();
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
    super.superResize(wR: kBonusHpWidthRatio, hR: kBonusHpHeightRatio);
  }

  @override
  void update(double t) {
    super.updateSuper(t);
  }
}
