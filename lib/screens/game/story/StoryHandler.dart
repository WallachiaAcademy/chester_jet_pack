import 'dart:collection';
import 'dart:ui';

import 'package:flutter/src/gestures/tap.dart';

import '../BaseEntity.dart';
import '../enemies/Rocket.dart';
import 'Step.dart';

StoryHandler storyHandler = StoryHandler();

class StoryHandler {
  List<BaseEntity> entities;
  Queue<Step> _steps;

  double _time = 0;
  Size _size = Size(0, 0);

  StoryHandler() {
    entities = List<BaseEntity>();
    _steps = Queue<Step>();
  }

  void _populateStory() {
    _steps.clear();
    _steps.addLast(Step(1, kRocket, null));
    _steps.addLast(Step(2, kRocket, null));
    _steps.addLast(Step(3, kRocket, null));

    _steps.addLast(Step(10, kRocket, null));
    _steps.addLast(Step(11, kRocket, null));
    _steps.addLast(Step(12, kRocket, null));
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

  void resize(Size size) {
    _size = size;
    for (var e in entities) e.resize(size);
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
        case kRocket:
          _spawnRocket();
          break;
        default:
          throw new Exception("Unimplemented entity type " +
              curStep.entityType.toString() +
              " time: " +
              curStep.spawnTime.toString());
      }
    }
  }

  void _spawnRocket() {
    Rocket r = Rocket();
    r.resize(_size);
    entities.add(r);
  }
}
