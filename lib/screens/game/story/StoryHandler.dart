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

    _steps.addLast(Step(1.85, EntityType.Coin, [0.845]));

    _steps.addLast(Step(2, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(2.03, EntityType.Coin, [0.685]));

    _steps.addLast(Step(2.18, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(2.18, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(2.21, EntityType.Coin, [0.525]));

    _steps.addLast(Step(2.36, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(2.36, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(2.39, EntityType.Coin, [0.525]));

    _steps.addLast(Step(2.57, EntityType.Coin, [0.525]));
    _steps.addLast(Step(2.59, EntityType.BottomPillar, [0.66]));
    _steps.addLast(Step(2.75, EntityType.Coin, [0.525]));

    _steps.addLast(Step(3, EntityType.BottomPillar, [0.66]));
    _steps.addLast(Step(3.12, EntityType.BonusHp, [0.525]));
    _steps.addLast(Step(3.5, EntityType.Rocket, [0.525]));

    _steps.addLast(Step(3.41, EntityType.BottomPillar, [0.66]));
    _steps.addLast(Step(3.49, EntityType.Coin, [0.525]));
    _steps.addLast(Step(3.67, EntityType.Coin, [0.525]));

    _steps.addLast(Step(3.82, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(3.82, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(3.85, EntityType.Coin, [0.525]));

    _steps.addLast(Step(4, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(4, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(4.03, EntityType.Coin, [0.525]));

    _steps.addLast(Step(4.18, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(4.21, EntityType.Coin, [0.685]));
    _steps.addLast(Step(4.39, EntityType.Coin, [0.845]));

    _steps.addLast(Step(5, EntityType.Bomb, [0.15]));

    _steps.addLast(Step(5, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(5, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(5.41, EntityType.TopPillar, [0.20]));
    _steps.addLast(Step(5.41, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(5.82, EntityType.TopPillar, [0.20]));
    _steps.addLast(Step(5.82, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(5.83, EntityType.Coin, [0.68]));
    _steps.addLast(Step(6.01, EntityType.Coin, [0.68]));
    _steps.addLast(Step(6, EntityType.Rocket, [0.73]));
    _steps.addLast(Step(6.19, EntityType.Coin, [0.68]));

    _steps.addLast(Step(6.23, EntityType.Coin, [0.05]));
    _steps.addLast(Step(6.23, EntityType.Coin, [0.2]));

    _steps.addLast(Step(6.23, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(6.23, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(6.41, EntityType.Coin, [0.05]));
    _steps.addLast(Step(6.41, EntityType.Coin, [0.2]));
    _steps.addLast(Step(6.59, EntityType.Coin, [0.05]));
    _steps.addLast(Step(6.59, EntityType.Coin, [0.2]));

    _steps.addLast(Step(6.64, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(6.64, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(6.77, EntityType.Coin, [0.05]));
    _steps.addLast(Step(6.77, EntityType.Coin, [0.2]));
    _steps.addLast(Step(6.95, EntityType.Coin, [0.05]));
    _steps.addLast(Step(6.95, EntityType.Coin, [0.2]));

    _steps.addLast(Step(7.05, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(7.05, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(7.13, EntityType.BonusHp, [0.05]));
    _steps.addLast(Step(7.13, EntityType.Coin, [0.2]));
    _steps.addLast(Step(7.31, EntityType.BonusHp, [0.05]));
    _steps.addLast(Step(7.31, EntityType.Coin, [0.2]));

    _steps.addLast(Step(7.46, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(7.46, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(7.49, EntityType.Coin, [0.05]));
    _steps.addLast(Step(7.49, EntityType.Coin, [0.2]));
    _steps.addLast(Step(7.67, EntityType.Coin, [0.05]));
    _steps.addLast(Step(7.67, EntityType.Coin, [0.2]));
    _steps.addLast(Step(7.85, EntityType.Coin, [0.05]));
    _steps.addLast(Step(7.85, EntityType.Coin, [0.2]));

    _steps.addLast(Step(7.87, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(7.87, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(8.03, EntityType.Coin, [0.05]));
    _steps.addLast(Step(8.03, EntityType.Coin, [0.2]));
    _steps.addLast(Step(8.21, EntityType.Coin, [0.05]));
    _steps.addLast(Step(8.21, EntityType.Coin, [0.2]));
    _steps.addLast(Step(8.5, EntityType.Rocket, [0.5]));

    _steps.addLast(Step(9.18, EntityType.MetalBox, [0.82]));

    _steps.addLast(Step(9.28, EntityType.Coin, [0.5]));
    _steps.addLast(Step(9.36, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(9.46, EntityType.Coin, [0.4]));
    _steps.addLast(Step(9.54, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(9.6, EntityType.WoodBox, [0.72]));
    _steps.addLast(Step(9.64, EntityType.Coin, [0.3]));
    _steps.addLast(Step(9.72, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(9.72, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(9.72, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(9.82, EntityType.Coin, [0.2]));
    _steps.addLast(Step(9.90, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(9.90, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(10, EntityType.Coin, [0.1]));
    _steps.addLast(Step(10.08, EntityType.ElectricObstacle, [0.61]));
    _steps.addLast(Step(10.21, EntityType.BonusHp, [0.1]));
    _steps.addLast(Step(10.4, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(10.4, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(10.4, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(10.58, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(10.58, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(10.75, EntityType.Rocket, [0.1]));
    _steps.addLast(Step(10.76, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(10.76, EntityType.WoodBox, [0.72]));
    _steps.addLast(Step(10.94, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(11.12, EntityType.MetalBox, [0.82]));

    _steps.addLast(Step(11.5, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(11.5, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(11.6, EntityType.Coin, [0.68]));

    _steps.addLast(Step(11.91, EntityType.TopPillar, [0.22]));
    _steps.addLast(Step(11.91, EntityType.BottomPillar, [0.82]));
    _steps.addLast(Step(12.01, EntityType.Coin, [0.7]));

    _steps.addLast(Step(12.32, EntityType.TopPillar, [0.24]));
    _steps.addLast(Step(12.32, EntityType.BottomPillar, [0.84]));
    _steps.addLast(Step(12.42, EntityType.Coin, [0.72]));

    _steps.addLast(Step(12.73, EntityType.TopPillar, [0.26]));
    _steps.addLast(Step(12.73, EntityType.BottomPillar, [0.86]));
    _steps.addLast(Step(12.83, EntityType.Coin, [0.74]));
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
