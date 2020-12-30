import 'dart:collection';
import 'dart:math';

import 'package:chesterjetpack/screens/game/entities/EntityType.dart';

import 'Step.dart';

class StoryQueue {
  Queue<Step> _steps;
  double _time;
  bool _populateOngoing = false;
  int _chapter = 0;
  Random _storyShuffler;

  StoryQueue() {
    _steps = new Queue<Step>();
    _storyShuffler = new Random();
  }

  void update(double t) {
    _time += t;
  }

  void reset() {
    _chapter = 0;
    _time = 0;
    _steps.clear();
    _populateStory();
  }

  void _populateStory() {
    const int maxChapter = 11;

    if (!_populateOngoing) {
      _populateOngoing = true;

      double startTime = 1;
      if (_steps.length > 0) startTime = (_steps.last.spawnTime + 0.5);

      var lastChapter = _chapter;
      while (lastChapter == _chapter)
        _chapter = _storyShuffler.nextInt(maxChapter);
      switch (_chapter) {
        case 0:
          _chapter0(startTime);
          break;
        case 1:
          _chapter1(startTime);
          break;
        case 2:
          _chapter2(startTime);
          break;
        case 3:
          _chapter3(startTime);
          break;
        case 4:
          _chapter4(startTime);
          break;
        case 5:
          _chapter5(startTime);
          break;
        case 6:
          _chapter6(startTime);
          break;
        case 7:
          _chapter7(startTime);
          break;
        case 8:
          _chapter8(startTime);
          break;
        case 9:
          _chapter9(startTime);
          break;
        case 10:
          _chapter10(startTime);
          break;
        default:
          _chapter0(startTime);
          break;
      }

      _populateOngoing = false;
    }
  }

  Step pop() {
    var step = _steps.first;
    _steps.removeFirst();

    if (_steps.length <= 10) _populateStory();
    return step;
  }

  bool storyAvailable() {
    return _time >= _steps.first.spawnTime;
  }

  deltaT(Step s) {
    return _time - s.spawnTime;
  }

  ///
  /// Chapters
  ///

  void _chapter0(double startTime) {
    _steps.addLast(Step(startTime + 0, EntityType.WoodBox, [0.88]));
    _steps.addLast(Step(startTime + 0.12, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.15, EntityType.Coin, [0.685]));

    _steps.addLast(Step(startTime + 0.3, EntityType.TopPillar, [0.1]));
    _steps.addLast(Step(startTime + 0.32, EntityType.ElectricObstacle, [0.75]));

    _steps.addLast(Step(startTime + 0.33, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 0.33, EntityType.Coin, [0.15]));
    _steps.addLast(Step(startTime + 0.51, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 0.51, EntityType.Coin, [0.15]));

    _steps.addLast(Step(startTime + 0.66, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.69, EntityType.Coin, [0.685]));
    _steps.addLast(Step(startTime + 0.84, EntityType.WoodBox, [0.88]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 0.9, EntityType.Rocket, [0.1]));
  }

  void _chapter1(double startTime) {
    _steps.addLast(Step(startTime + 0, EntityType.BottomPillar, [0.7]));
    _steps.addLast(Step(startTime + 0.11, EntityType.Bomb, [0.85]));
    _steps.addLast(Step(startTime + 0.11, EntityType.Coin, [0.55]));

    _steps.addLast(Step(startTime + 0.41, EntityType.BottomPillar, [0.675]));
    _steps.addLast(Step(startTime + 0.52, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 0.82, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 0.93, EntityType.Coin, [0.5]));

    _steps.addLast(Step(startTime + 1.23, EntityType.BottomPillar, [0.625]));
    _steps.addLast(Step(startTime + 1.34, EntityType.Coin, [0.475]));

    _steps.addLast(Step(startTime + 1.64, EntityType.BottomPillar, [0.6]));
    _steps.addLast(Step(startTime + 1.75, EntityType.Coin, [0.45]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 1.75, EntityType.BonusHp, [0.85]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 1.75, EntityType.BonusHp, [0.7]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 1.9, EntityType.Rocket, [0.3]));
  }

  void _chapter2(double startTime) {
    _steps.addLast(Step(startTime + 0, EntityType.MetalBox, [0.82]));

    _steps.addLast(Step(startTime + 0.18, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.18, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.18, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(startTime + 0.21, EntityType.Coin, [0.45]));

    _steps.addLast(Step(startTime + 0.36, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.36, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.39, EntityType.Coin, [0.45]));

    _steps.addLast(Step(startTime + 0.54, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.54, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.54, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(startTime + 0.57, EntityType.Coin, [0.45]));

    _steps.addLast(Step(startTime + 0.72, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.72, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.75, EntityType.Coin, [0.45]));
    _steps.addLast(Step(startTime + 0.93, EntityType.BonusHp, [0.845]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 0.93, EntityType.Rocket, [0.05]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 0.93, EntityType.Rocket, [0.15]));
  }

  void _chapter3(double startTime) {
    _steps.addLast(Step(startTime + 0.0, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.0, EntityType.Spikes, [0.77]));
    _steps.addLast(Step(startTime + 0.03, EntityType.Coin, [0.205]));

    _steps.addLast(Step(startTime + 0.18, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.21, EntityType.Coin, [0.045]));

    _steps.addLast(Step(startTime + 0.36, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.36, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.36, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(startTime + 0.39, EntityType.Coin, [0.205]));

    _steps.addLast(Step(startTime + 0.54, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.54, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.57, EntityType.Coin, [0.045]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 0.57, EntityType.Rocket, [0.205]));

    _steps.addLast(Step(startTime + 0.72, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.72, EntityType.Spikes, [0.77]));
    _steps.addLast(Step(startTime + 0.75, EntityType.Coin, [0.205]));

    _steps.addLast(Step(startTime + 0.9, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.93, EntityType.Coin, [0.045]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 0.93, EntityType.BonusHp, [0.625]));
  }

  void _chapter4(double startTime) {
    _steps.addLast(Step(startTime + 0, EntityType.TopPillar, [0.1]));
    _steps.addLast(Step(startTime + 0, EntityType.BottomPillar, [0.75]));
    _steps.addLast(Step(startTime + 0.11, EntityType.Coin, [0.5]));

    _steps.addLast(Step(startTime + 0.41, EntityType.TopPillar, [0.15]));
    _steps.addLast(Step(startTime + 0.41, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 0.52, EntityType.Coin, [0.55]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 0.6, EntityType.Rocket, [0.5]));
    else
      _steps.addLast(Step(startTime + 0.6, EntityType.Rocket, [0.15]));

    _steps.addLast(Step(startTime + 0.82, EntityType.TopPillar, [0.1]));
    _steps.addLast(Step(startTime + 0.82, EntityType.BottomPillar, [0.75]));
    _steps.addLast(Step(startTime + 0.93, EntityType.Coin, [0.5]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 1.2, EntityType.Rocket, [0.5]));

    _steps.addLast(Step(startTime + 1.23, EntityType.TopPillar, [0.15]));
    _steps.addLast(Step(startTime + 1.23, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 1.34, EntityType.Coin, [0.55]));

    _steps.addLast(Step(startTime + 1.64, EntityType.TopPillar, [0.1]));
    _steps.addLast(Step(startTime + 1.64, EntityType.BottomPillar, [0.75]));
    _steps.addLast(Step(startTime + 1.75, EntityType.Coin, [0.5]));

    _steps.addLast(Step(startTime + 2.05, EntityType.TopPillar, [0.15]));
    _steps.addLast(Step(startTime + 2.05, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 2.16, EntityType.BonusHp, [0.55]));
  }

  void _chapter5(double startTime) {
    _steps.addLast(Step(startTime + 0, EntityType.Coin, [0.845]));

    _steps.addLast(Step(startTime + 0.15, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.18, EntityType.Coin, [0.685]));

    _steps.addLast(Step(startTime + 0.33, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.33, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.36, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 0.51, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.51, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.54, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 0.74, EntityType.BottomPillar, [0.66]));
    _steps.addLast(Step(startTime + 0.85, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 1.15, EntityType.BottomPillar, [0.66]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 1.26, EntityType.BonusHp, [0.525]));
    else
      _steps.addLast(Step(startTime + 1.26, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 1.5, EntityType.Rocket, [0.525]));

    _steps.addLast(Step(startTime + 1.56, EntityType.BottomPillar, [0.66]));
    _steps.addLast(Step(startTime + 1.67, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 1.97, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 1.97, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 2.00, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 2.15, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 2.15, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 2.18, EntityType.Coin, [0.525]));

    _steps.addLast(Step(startTime + 2.33, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 2.36, EntityType.Coin, [0.685]));
    _steps.addLast(Step(startTime + 2.54, EntityType.Coin, [0.845]));
  }

  void _chapter6(double startTime) {
    _steps.addLast(Step(startTime + 0.00, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 0.00, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 0.11, EntityType.Coin, [0.66]));
    _steps.addLast(Step(startTime + 0.11, EntityType.Bomb, [0.15]));

    _steps.addLast(Step(startTime + 0.41, EntityType.TopPillar, [0.20]));
    _steps.addLast(Step(startTime + 0.41, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 0.52, EntityType.Coin, [0.48]));

    _steps.addLast(Step(startTime + 0.82, EntityType.TopPillar, [0.20]));
    _steps.addLast(Step(startTime + 0.82, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 0.93, EntityType.Coin, [0.66]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 1.2, EntityType.Rocket, [0.5]));
    else
      _steps.addLast(Step(startTime + 1.2, EntityType.Rocket, [0.7]));

    _steps.addLast(Step(startTime + 1.23, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 1.23, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 1.34, EntityType.Coin, [0.48]));
    _steps.addLast(Step(startTime + 1.34, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 1.34, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 1.64, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 1.64, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 1.75, EntityType.Coin, [0.66]));
    _steps.addLast(Step(startTime + 1.75, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 1.75, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 2.05, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 2.05, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 2.16, EntityType.Coin, [0.48]));
    _steps.addLast(Step(startTime + 2.16, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 2.16, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 2.46, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 2.46, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 2.57, EntityType.Coin, [0.66]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 2.57, EntityType.BonusHp, [0.05]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 2.57, EntityType.BonusHp, [0.2]));

    _steps.addLast(Step(startTime + 2.87, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 2.87, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 2.98, EntityType.Coin, [0.48]));
    _steps.addLast(Step(startTime + 2.98, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 2.98, EntityType.Coin, [0.2]));

    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 3.2, EntityType.Rocket, [0.5]));
    else
      _steps.addLast(Step(startTime + 3.2, EntityType.Rocket, [0.7]));
  }

  void _chapter7(double startTime) {
    _steps.addLast(Step(startTime + 0.06, EntityType.WoodBox, [0.88]));

    _steps.addLast(Step(startTime + 0.18, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.28, EntityType.Coin, [0.5]));

    _steps.addLast(Step(startTime + 0.36, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.46, EntityType.Coin, [0.4]));

    _steps.addLast(Step(startTime + 0.54, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.6, EntityType.WoodBox, [0.72]));
    _steps.addLast(Step(startTime + 0.64, EntityType.Coin, [0.3]));

    _steps.addLast(Step(startTime + 0.72, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.72, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.72, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(startTime + 0.82, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 0.90, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.90, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 1.00, EntityType.Coin, [0.1]));

    _steps.addLast(Step(startTime + 1.08, EntityType.ElectricObstacle, [0.61]));
    _steps.addLast(Step(startTime + 1.08, EntityType.WoodBox, [0.88]));
    _steps.addLast(Step(startTime + 1.08, EntityType.WoodBox, [0.78]));
    _steps.addLast(Step(startTime + 1.2, EntityType.WoodBox, [0.78]));
    _steps.addLast(Step(startTime + 1.28, EntityType.WoodBox, [0.88]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 1.21, EntityType.BonusHp, [0.1]));
    else
      _steps.addLast(Step(startTime + 1.21, EntityType.Coin, [0.1]));

    _steps.addLast(Step(startTime + 1.4, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 1.4, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 1.4, EntityType.Spikes, [0.61]));

    _steps.addLast(Step(startTime + 1.58, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 1.58, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 1.75, EntityType.Rocket, [0.1]));

    _steps.addLast(Step(startTime + 1.76, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 1.76, EntityType.WoodBox, [0.72]));

    _steps.addLast(Step(startTime + 1.94, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 2.12, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 2.30, EntityType.WoodBox, [0.88]));
  }

  void _chapter8(double startTime) {
    _steps.addLast(Step(startTime + 0.0, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 0.0, EntityType.BottomPillar, [0.8]));
    _steps.addLast(Step(startTime + 0.1, EntityType.Coin, [0.68]));

    _steps.addLast(Step(startTime + 0.41, EntityType.TopPillar, [0.22]));
    _steps.addLast(Step(startTime + 0.41, EntityType.BottomPillar, [0.82]));
    _steps.addLast(Step(startTime + 0.51, EntityType.Coin, [0.7]));

    _steps.addLast(Step(startTime + 0.82, EntityType.TopPillar, [0.24]));
    _steps.addLast(Step(startTime + 0.82, EntityType.BottomPillar, [0.84]));
    _steps.addLast(Step(startTime + 0.92, EntityType.Coin, [0.72]));

    _steps.addLast(Step(startTime + 1.23, EntityType.TopPillar, [0.26]));
    _steps.addLast(Step(startTime + 1.23, EntityType.BottomPillar, [0.86]));
    _steps.addLast(Step(startTime + 1.33, EntityType.Coin, [0.74]));

    _steps.addLast(Step(startTime + 1.64, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 1.67, EntityType.Coin, [0.685]));

    _steps.addLast(Step(startTime + 1.82, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 1.85, EntityType.Coin, [0.685]));

    _steps.addLast(Step(startTime + 2.00, EntityType.MetalBox, [0.82]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 2.03, EntityType.BonusHp, [0.685]));
    else
      _steps.addLast(Step(startTime + 2.03, EntityType.Coin, [0.685]));

    _steps.addLast(Step(startTime + 2.18, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 2.18, EntityType.WoodBox, [0.62]));
    _steps.addLast(Step(startTime + 2.18, EntityType.Bomb, [0.5]));
    _steps.addLast(Step(startTime + 2.24, EntityType.WoodBox, [0.72]));
  }

  void _chapter9(double startTime) {
    _steps.addLast(Step(startTime + 0.0, EntityType.BottomPillar, [0.85]));
    _steps.addLast(Step(startTime + 0.11, EntityType.Coin, [0.7]));

    _steps.addLast(Step(startTime + 0.41, EntityType.BottomPillar, [0.75]));
    _steps.addLast(Step(startTime + 0.52, EntityType.Coin, [0.6]));

    _steps.addLast(Step(startTime + 0.82, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 0.93, EntityType.Coin, [0.50]));

    _steps.addLast(Step(startTime + 1.23, EntityType.ElectricObstacle, [0.6]));

    _steps.addLast(Step(startTime + 1.60, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 1.71, EntityType.Coin, [0.50]));

    _steps.addLast(Step(startTime + 2.01, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 2.12, EntityType.Coin, [0.50]));
    _steps.addLast(Step(startTime + 2.12, EntityType.Coin, [0.85]));

    _steps.addLast(Step(startTime + 2.42, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 2.53, EntityType.Coin, [0.50]));
    _steps.addLast(Step(startTime + 2.53, EntityType.Coin, [0.85]));

    _steps.addLast(Step(startTime + 2.6, EntityType.Rocket, [0.10]));
    _steps.addLast(Step(startTime + 2.75, EntityType.Rocket, [0.20]));
    _steps.addLast(Step(startTime + 2.83, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 2.90, EntityType.Rocket, [0.30]));
    _steps.addLast(Step(startTime + 2.94, EntityType.Coin, [0.50]));
    _steps.addLast(Step(startTime + 2.94, EntityType.Coin, [0.85]));

    _steps.addLast(Step(startTime + 3.24, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 3.35, EntityType.Coin, [0.50]));
    _steps.addLast(Step(startTime + 3.35, EntityType.BonusHp, [0.85]));

    _steps.addLast(Step(startTime + 3.65, EntityType.BottomPillar, [0.65]));
    _steps.addLast(Step(startTime + 3.76, EntityType.Coin, [0.50]));
    if (_storyShuffler.nextBool())
      _steps.addLast(Step(startTime + 3.76, EntityType.BonusHp, [0.85]));
  }

  void _chapter10(double startTime) {
    _steps.addLast(Step(startTime + 0.00, EntityType.Coin, [0.85]));
    _steps.addLast(Step(startTime + 0.18, EntityType.Coin, [0.69]));
    _steps.addLast(Step(startTime + 0.36, EntityType.Coin, [0.56]));

    _steps.addLast(Step(startTime + 0.42, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.51, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.51, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(startTime + 0.54, EntityType.Coin, [0.43]));
    _steps.addLast(Step(startTime + 0.63, EntityType.BonusHp, [0.85]));
    _steps.addLast(Step(startTime + 0.69, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 0.72, EntityType.Coin, [0.43]));

    _steps.addLast(Step(startTime + 0.78, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 0.90, EntityType.Coin, [0.56]));
    _steps.addLast(Step(startTime + 1.08, EntityType.Coin, [0.69]));
    _steps.addLast(Step(startTime + 1.2, EntityType.Rocket, [0.1]));
    _steps.addLast(Step(startTime + 1.26, EntityType.Coin, [0.85]));
  }
}
