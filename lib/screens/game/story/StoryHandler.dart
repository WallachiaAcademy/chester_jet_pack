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
import 'package:chesterjetpack/screens/game/story/StoryQueue.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../enemies/Rocket.dart';
import '../entities/BaseEntity.dart';

StoryHandler storyHandler = StoryHandler();

class StoryHandler {
  List<BaseEntity> entities;
  StoryQueue _queue;

  StoryHandler() {
    entities = List<BaseEntity>();
    _queue = StoryQueue();
  }

  void reset() {
    _queue.reset();
    entities.clear();
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
    _queue.update(t);
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
    while (_queue.storyAvailable()) {
      var curStep = _queue.pop();
      var deltaT = _queue.deltaT(curStep);

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
