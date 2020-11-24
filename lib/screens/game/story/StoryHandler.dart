import 'dart:collection';
import 'dart:ui';

import 'package:chesterjetpack/screens/game/enemies/Bomb.dart';
import 'package:chesterjetpack/screens/game/enemies/ElectricObstacle.dart';
import 'package:chesterjetpack/screens/game/entities/EntityType.dart';
import 'package:chesterjetpack/screens/game/rewards/BonusHp.dart';
import 'package:chesterjetpack/screens/game/rewards/Coin.dart';
import 'package:chesterjetpack/screens/game/stage/MetalBox.dart';
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

    _steps.addLast(Step(5, EntityType.MetalBox, [0.93]));
    _steps.addLast(Step(5, EntityType.Coin, [0.73]));

    _steps.addLast(Step(5.18, EntityType.MetalBox, [0.93]));
    _steps.addLast(Step(5.18, EntityType.MetalBox, [0.78]));
    _steps.addLast(Step(5.18, EntityType.Coin, [0.63]));

    _steps.addLast(Step(5.36, EntityType.MetalBox, [0.93]));
    _steps.addLast(Step(5.36, EntityType.MetalBox, [0.78]));
    _steps.addLast(Step(5.36, EntityType.MetalBox, [0.63]));
    _steps.addLast(Step(5.36, EntityType.Coin, [0.53]));

    _steps.addLast(Step(5.54, EntityType.MetalBox, [0.93]));
    _steps.addLast(Step(5.54, EntityType.MetalBox, [0.78]));
    _steps.addLast(Step(5.54, EntityType.MetalBox, [0.63]));
    _steps.addLast(Step(5.54, EntityType.Bomb, [0.48]));
    _steps.addLast(Step(5.54, EntityType.Coin, [0.43]));

    _steps.addLast(Step(5.72, EntityType.MetalBox, [0.93]));
    _steps.addLast(Step(5.72, EntityType.MetalBox, [0.78]));
    _steps.addLast(Step(5.72, EntityType.MetalBox, [0.63]));
    _steps.addLast(Step(5.72, EntityType.Coin, [0.33]));
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
    while (_steps.length > 0 && _time >= _steps.first.spawnTime) {
      var curStep = _steps.first;
      var deltaT = _time - curStep.spawnTime;
      _steps.removeFirst();

      switch (curStep.entityType) {
        case EntityType.Rocket:
          _appendEntity(Rocket(curStep.args), deltaT);
          break;
        case EntityType.Bomb:
          _appendEntity(Bomb(curStep.args), deltaT);
          break;
        case EntityType.ElectricObstacle:
          _appendEntity(ElectricObstacle(curStep.args), deltaT);
          break;
        case EntityType.BonusHp:
          _appendEntity(BonusHp(curStep.args), deltaT);
          break;
        case EntityType.Coin:
          _appendEntity(Coin(curStep.args), deltaT);
          break;
        case EntityType.WoodBox:
          _appendEntity(WoodBox(curStep.args), deltaT);
          break;
        case EntityType.MetalBox:
          _appendEntity(MetalBox(curStep.args), deltaT);
          break;
        default:
          throw new Exception("Unimplemented entity type " +
              curStep.entityType.toString() +
              " time: " +
              curStep.spawnTime.toString());
      }
    }
  }

  void _appendEntity(BaseEntity _entity, double deltaT) {
    _entity.resize();
    _entity.update(deltaT);
    entities.add(_entity);
  }
}
