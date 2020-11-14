import 'dart:collection';
import 'dart:ui';

import 'package:chesterjetpack/screens/game/enemies/Bomb.dart';
import 'package:chesterjetpack/screens/game/enemies/ElectricObstacle.dart';
import 'package:chesterjetpack/screens/game/entities/EntityType.dart';
import 'package:chesterjetpack/screens/game/rewards/BonusHp.dart';
import 'package:chesterjetpack/screens/game/rewards/Coin.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../enemies/Rocket.dart';
import '../entities/BaseEntity.dart';
import 'Step.dart';

StoryHandler storyHandler = StoryHandler();

class StoryHandler {
  List<BaseEntity> entities;
  Queue<Step> _steps;

  double _time = 0;

  StoryHandler() {
    entities = List<BaseEntity>();
    _steps = Queue<Step>();
  }

  void _populateStory() {
    _steps.clear();

    _steps.addLast(Step(1, EntityType.Coin, [0.5]));
    _steps.addLast(Step(1.4, EntityType.Coin, [0.4]));
    _steps.addLast(Step(1.8, EntityType.Coin, [0.3]));
    _steps.addLast(Step(2.2, EntityType.Coin, [0.4]));
    _steps.addLast(Step(2.6, EntityType.Coin, [0.5]));
    _steps.addLast(Step(3, EntityType.ElectricObstacle, [0.9]));
    _steps.addLast(Step(3.25, EntityType.Bomb, [0.8]));

    _steps.addLast(Step(4, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(4.25, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(4.5, EntityType.Rocket, [0.3]));

    _steps.addLast(Step(5, EntityType.ElectricObstacle, [0.9]));
    _steps.addLast(Step(5.25, EntityType.Bomb, [0.8]));

    _steps.addLast(Step(6, EntityType.Rocket, [0.3]));

    _steps.addLast(Step(7, EntityType.ElectricObstacle, [0.9]));
    _steps.addLast(Step(7.25, EntityType.Bomb, [0.8]));

    _steps.addLast(Step(8, EntityType.Rocket, [0.3]));

    _steps.addLast(Step(9, EntityType.BonusHp, [0.3]));
    _steps.addLast(Step(10, EntityType.BonusHp, [0.3]));
    _steps.addLast(Step(11, EntityType.BonusHp, [0.3]));
    _steps.addLast(Step(12, EntityType.BonusHp, [0.3]));
    _steps.addLast(Step(13, EntityType.BonusHp, [0.3]));
    _steps.addLast(Step(14, EntityType.BonusHp, [0.3]));
  }

  void reset() {
    _populateStory();
  }

  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  void render(Canvas canvas) {
    for (var e in entities) e.render(canvas);
  }

  void resize() {
    for (var e in entities) e.resize();
  }

  void update(double t) {
    // Update
    _time += t;
    for (var e in entities) e.update(t);

    // Cleanup
    for (int i = entities.length - 1; i >= 0; i--) {
      if (entities.elementAt(i).isDead()) {
        entities.removeAt(i);
      }
    }

    //Spawning
    _spawn();
  }

  void _spawn() {
    while (_steps.length > 0 && _time > _steps.first.spawnTime) {
      var curStep = _steps.first;
      _steps.removeFirst();

      switch (curStep.entityType) {
        case EntityType.Rocket:
          _spawnRocket(curStep.args);
          break;
        case EntityType.Bomb:
          _spawnBomb(curStep.args);
          break;
        case EntityType.ElectricObstacle:
          _spawnEletricObstacle(curStep.args);
          break;
        case EntityType.BonusHp:
          _spawnBonusHp(curStep.args);
          break;
        case EntityType.Coin:
          _spawnCoin(curStep.args);
          break;
        default:
          throw new Exception("Unimplemented entity type " +
              curStep.entityType.toString() +
              " time: " +
              curStep.spawnTime.toString());
      }
    }
  }

  void _spawnRocket(List<double> args) {
    Rocket r = Rocket(args);
    r.resize();
    entities.add(r);
  }

  void _spawnBomb(List<double> args) {
    Bomb b = Bomb(args);
    b.resize();
    entities.add(b);
  }

  void _spawnEletricObstacle(List<double> args) {
    ElectricObstacle _eo = ElectricObstacle(args);
    _eo.resize();
    entities.add(_eo);
  }

  void _spawnBonusHp(List<double> args) {
    BonusHp _bhp = BonusHp(args);
    _bhp.resize();
    entities.add(_bhp);
  }

  void _spawnCoin(List<double> args) {
    Coin _coin = Coin(args);
    _coin.resize();
    entities.add(_coin);
  }
}
