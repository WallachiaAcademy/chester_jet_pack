import 'dart:ui';

import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/entities/AnimatedEntity.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
import 'package:flutter/src/gestures/tap.dart';

class Coin extends AnimatedEntity {
  Coin(List<double> args) : super('rewards/coin', 6, 0.1, args);

  @override
  void hit(BasePlayer player) {
    player.collectCoin();
    die();
  }

  @override
  bool isDead() {
    return isDeadSuper();
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  bool overlaps(Rect rect) {
    return overlapsSuper(rect);
  }

  @override
  void render(Canvas canvas) {
    renderSuper(canvas);
  }

  @override
  void resize() {
    resizeSuper(wR: kCoinWidthRatio, hR: kCoinHeightRatio);
  }

  @override
  void update(double t) {
    updateSuper(t, normalFact: kCoinSpeed);
  }
}
