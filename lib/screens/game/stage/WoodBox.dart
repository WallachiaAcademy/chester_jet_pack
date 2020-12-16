import 'dart:ui';

import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/game/entities/StaticBaseEntity.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';
import 'package:flutter/src/gestures/tap.dart';

class WoodBox extends StaticBaseEntity {
  WoodBox(List<double> args) : super('stage/wood_box.png', args);

  @override
  void hit(BasePlayer player) {
    player.reposition(getSurface());
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
    resizeSuper(wR: kWoodBoxWidthRatio, hR: kWoodBoxHeightRatio);
  }

  @override
  void update(double t) {
    updateSuper(t);
  }
}
