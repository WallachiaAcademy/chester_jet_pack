import 'dart:collection';
import 'dart:ui';

import 'package:chesterjetpack/screens/game/enemies/Bomb.dart';
import 'package:chesterjetpack/screens/game/enemies/ElectricObstacle.dart';
import 'package:chesterjetpack/screens/game/entities/EntityType.dart';
import 'package:chesterjetpack/screens/game/rewards/BonusHp.dart';
import 'package:chesterjetpack/screens/game/rewards/Coin.dart';
import 'package:chesterjetpack/screens/game/stage/WoodBox.dart';
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

    _steps.addLast(Step(4.4, EntityType.ElectricObstacle, [0.95]));
    _steps.addLast(Step(4.4, EntityType.Coin, [0.83]));
    _steps.addLast(Step(4.6, EntityType.Coin, [0.83]));
    _steps.addLast(Step(4.8, EntityType.Coin, [0.83]));

    _steps.addLast(Step(5, EntityType.WoodBox, [0.93]));
    _steps.addLast(Step(5, EntityType.Coin, [0.73]));

    _steps.addLast(Step(5.12, EntityType.WoodBox, [0.93]));
    _steps.addLast(Step(5.12, EntityType.WoodBox, [0.83]));
    _steps.addLast(Step(5.12, EntityType.Coin, [0.63]));

    _steps.addLast(Step(5.24, EntityType.WoodBox, [0.93]));
    _steps.addLast(Step(5.24, EntityType.WoodBox, [0.83]));
    _steps.addLast(Step(5.24, EntityType.WoodBox, [0.73]));
    _steps.addLast(Step(5.24, EntityType.Coin, [0.53]));

    _steps.addLast(Step(5.36, EntityType.WoodBox, [0.93]));
    _steps.addLast(Step(5.36, EntityType.WoodBox, [0.83]));
    _steps.addLast(Step(5.36, EntityType.WoodBox, [0.73]));
    _steps.addLast(Step(5.36, EntityType.Bomb, [0.63]));
    _steps.addLast(Step(5.36, EntityType.Coin, [0.43]));

    _steps.addLast(Step(5.48, EntityType.WoodBox, [0.93]));
    _steps.addLast(Step(5.48, EntityType.WoodBox, [0.83]));
    _steps.addLast(Step(5.48, EntityType.WoodBox, [0.73]));
    _steps.addLast(Step(5.48, EntityType.Coin, [0.33]));
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
        case EntityType.WoodBox:
          _appendEntity(WoodBox(curStep.args));
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

  void _appendEntity(BaseEntity _entity) {
    _entity.resize();
    entities.add(_entity);
  }
}
