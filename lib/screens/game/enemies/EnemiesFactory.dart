import 'dart:ui';

import 'package:chesterjetpack/screens/game/enemies/BaseEnemy.dart';
import 'package:flutter/src/gestures/tap.dart';

import 'Rocket.dart';

EnemiesFactory enemiesFactory = EnemiesFactory();

class EnemiesFactory {
  List<BaseEnemy> enemies;
  double _time = 0;
  Size _size = Size(0, 0);
  EnemiesFactory() {
    enemies = List<BaseEnemy>();
  }

  void reset() {}
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    for (var e in enemies) e.render(canvas);
  }

  @override
  void resize(Size size) {
    _size = size;
    for (var e in enemies) e.resize(size);
  }

  @override
  void update(double t) {
    // Update
    for (var e in enemies) e.update(t);

    // Cleanup
    for (int i = enemies.length - 1; i >= 0; i--) {
      if (enemies.elementAt(i).isDead()) {
        enemies.removeAt(i);
      }
    }

    //Spawning
    // TODO: to rework here
    _time += t;
    if (_time > 1) {
      _time -= 1;
      Rocket r = Rocket();
      r.resize(_size);
      enemies.add(r);
    }
  }
}
