import 'dart:ui';

import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/entities/StaticBaseEntity.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
import 'package:flutter/src/gestures/tap.dart';

class Spikes extends StaticBaseEntity {
  Spikes(List<double> args) : super('stage/spikes.png', args);

  @override
  void hit(BasePlayer player) {
    player.hit();
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
    resizeSuper(wR: kSpikesWidthRatio, hR: kSpikesHeightRatio);
  }

  @override
  void update(double t) {
    updateSuper(t);
  }
}
