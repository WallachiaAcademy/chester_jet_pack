import 'dart:collection';
import 'dart:ui';

import 'package:chesterjetpack/screens/game/enemies/Bomb.dart';
import 'package:chesterjetpack/screens/game/entities/EntityType.dart';
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
    _steps.addLast(Step(1, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(1, EntityType.Rocket, [0.4]));
    _steps.addLast(Step(1, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(1, EntityType.Rocket, [0.6]));
    _steps.addLast(Step(1, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(1.2, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(1.4, EntityType.Rocket, [0.5]));

    _steps.addLast(Step(1.6, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(1.6, EntityType.Rocket, [0.4]));
    _steps.addLast(Step(1.6, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(1.6, EntityType.Rocket, [0.6]));
    _steps.addLast(Step(1.6, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(2, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(2, EntityType.Rocket, [0.4]));
    _steps.addLast(Step(2, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(2, EntityType.Rocket, [0.6]));
    _steps.addLast(Step(2, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(2.2, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(2.2, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(2.2, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(2.4, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(2.4, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(2.4, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(2.8, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(2.8, EntityType.Rocket, [0.4]));
    _steps.addLast(Step(2.8, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(2.8, EntityType.Rocket, [0.6]));
    _steps.addLast(Step(2.8, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(3, EntityType.Rocket, [0.7]));
    _steps.addLast(Step(3.2, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(3.6, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(3.6, EntityType.Rocket, [0.4]));
    _steps.addLast(Step(3.6, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(3.6, EntityType.Rocket, [0.6]));
    _steps.addLast(Step(3.6, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(3.8, EntityType.Rocket, [0.7]));
    _steps.addLast(Step(4, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(4.4, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(4.4, EntityType.Rocket, [0.4]));
    _steps.addLast(Step(4.4, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(4.4, EntityType.Rocket, [0.6]));
    _steps.addLast(Step(4.4, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(4.6, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(4.6, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(4.8, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(4.8, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(5, EntityType.Rocket, [0.3]));
    _steps.addLast(Step(5, EntityType.Rocket, [0.4]));
    _steps.addLast(Step(5, EntityType.Rocket, [0.5]));
    _steps.addLast(Step(5, EntityType.Rocket, [0.6]));
    _steps.addLast(Step(5, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(5.4, EntityType.Bomb, [0.7]));
    _steps.addLast(Step(5.6, EntityType.Bomb, [0.7]));
    _steps.addLast(Step(5.8, EntityType.Bomb, [0.7]));
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
}
