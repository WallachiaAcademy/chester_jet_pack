import 'dart:collection';
import 'dart:ui';

import 'package:chesterjetpack/screens/game/enemies/Bomb.dart';
import 'package:chesterjetpack/screens/game/enemies/ElectricObstacle.dart';
import 'package:chesterjetpack/screens/game/entities/EntityType.dart';
import 'package:chesterjetpack/screens/game/rewards/BonusHp.dart';
import 'package:chesterjetpack/screens/game/rewards/Coin.dart';
import 'package:chesterjetpack/screens/game/stage/MetalBox.dart';
import 'package:chesterjetpack/screens/game/stage/Pillar.dart';
import 'package:chesterjetpack/screens/game/stage/Spikes.dart';
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

    _steps.addLast(Step(3, EntityType.TopPillar, [0.15]));
    _steps.addLast(Step(3, EntityType.BottomPillar, [0.95]));
    _steps.addLast(Step(3.25, EntityType.Bomb, [0.55]));

    _steps.addLast(Step(3.5, EntityType.TopPillar, [0.10]));
    _steps.addLast(Step(3.5, EntityType.BottomPillar, [0.9]));
    _steps.addLast(Step(3.75, EntityType.Bomb, [0.5]));

    _steps.addLast(Step(4, EntityType.TopPillar, [0.05]));
    _steps.addLast(Step(4, EntityType.BottomPillar, [0.85]));
    _steps.addLast(Step(4.25, EntityType.Bomb, [0.45]));
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
        case EntityType.Spikes:
          _appendEntity(Spikes(curStep.args), deltaT);
          break;
        case EntityType.TopPillar:
          _appendEntity(TopPillar(curStep.args), deltaT);
          break;
        case EntityType.BottomPillar:
          _appendEntity(BottomPillar(curStep.args), deltaT);
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
