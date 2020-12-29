import 'dart:collection';

import 'package:chesterjetpack/screens/game/entities/EntityType.dart';

import 'Step.dart';

class StoryQueue {
  Queue<Step> _steps;
  double _time;
  bool _populateOngoing = false;
  int _chapter = 0;

  StoryQueue() {
    _steps = new Queue<Step>();
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
    if (!_populateOngoing) {
      _populateOngoing = true;

      switch (_chapter) {
        case 0:
          _chapter0();
          break;
        case 1:
          _chapter1();
          break;
        case 2:
          _chapter2();
          break;
        case 3:
          _chapter3();
          break;
        default:
          _finalStory();
          break;
      }
      _chapter++;
      _populateOngoing = false;
    }
  }

  void _chapter0() {
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
  }

  void _chapter1() {
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
  }

  void _chapter2() {
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

    _steps.addLast(Step(13.2, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(13.23, EntityType.Coin, [0.685]));

    _steps.addLast(Step(13.38, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(13.41, EntityType.Coin, [0.685]));

    _steps.addLast(Step(13.56, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(13.59, EntityType.Coin, [0.685]));

    _steps.addLast(Step(13.74, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(13.77, EntityType.Coin, [0.685]));

    _steps.addLast(Step(13.92, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(13.95, EntityType.Coin, [0.685]));

    _steps.addLast(Step(14.10, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(14.13, EntityType.Coin, [0.685]));

    _steps.addLast(Step(14.28, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(14.31, EntityType.Coin, [0.685]));

    _steps.addLast(Step(14.46, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(14.46, EntityType.WoodBox, [0.72]));
    _steps.addLast(Step(14.49, EntityType.Coin, [0.585]));
    _steps.addLast(Step(14.58, EntityType.WoodBox, [0.72]));

    _steps.addLast(Step(14.64, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(14.67, EntityType.Coin, [0.585]));
    _steps.addLast(Step(14.70, EntityType.WoodBox, [0.72]));

    _steps.addLast(Step(14.82, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(14.85, EntityType.Coin, [0.685]));
  }

  void _chapter3() {
    _steps.addLast(Step(15.00, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(15.03, EntityType.Coin, [0.685]));
    _steps.addLast(Step(15.18, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(15.21, EntityType.Coin, [0.685]));

    _steps.addLast(Step(15.45, EntityType.BottomPillar, [0.6]));
    _steps.addLast(Step(15.86, EntityType.BottomPillar, [0.575]));
    _steps.addLast(Step(16.27, EntityType.BottomPillar, [0.55]));
    _steps.addLast(Step(16.68, EntityType.BottomPillar, [0.525]));
  }

  void _finalStory() {
    double startTime = (_steps.last.spawnTime.round() + 1).toDouble();

    _steps.addLast(Step(startTime + 0, EntityType.Bomb, [0.15]));

    _steps.addLast(Step(startTime + 0, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 0, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(startTime + 0.41, EntityType.TopPillar, [0.20]));
    _steps.addLast(Step(startTime + 0.41, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(startTime + 0.82, EntityType.TopPillar, [0.20]));
    _steps.addLast(Step(startTime + 0.82, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(0.83, EntityType.Coin, [0.68]));
    _steps.addLast(Step(startTime + 1.01, EntityType.Coin, [0.68]));
    _steps.addLast(Step(startTime + 1, EntityType.Rocket, [0.73]));
    _steps.addLast(Step(startTime + 1.19, EntityType.Coin, [0.68]));

    _steps.addLast(Step(startTime + 1.23, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 1.23, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 1.23, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 1.23, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(startTime + 1.41, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 1.41, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 1.59, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 1.59, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 1.64, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 1.64, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(startTime + 1.77, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 1.77, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 1.95, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 1.95, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 2.05, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 2.05, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(startTime + 2.13, EntityType.BonusHp, [0.05]));
    _steps.addLast(Step(startTime + 2.13, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 2.31, EntityType.BonusHp, [0.05]));
    _steps.addLast(Step(startTime + 2.31, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 2.46, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 2.46, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(startTime + 2.49, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 2.49, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 2.67, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 2.67, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 2.85, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 2.85, EntityType.Coin, [0.2]));

    _steps.addLast(Step(startTime + 2.87, EntityType.TopPillar, [0.2]));
    _steps.addLast(Step(startTime + 2.87, EntityType.BottomPillar, [0.8]));

    _steps.addLast(Step(startTime + 3.03, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 3.03, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 3.21, EntityType.Coin, [0.05]));
    _steps.addLast(Step(startTime + 3.21, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 3.5, EntityType.Rocket, [0.5]));

    _steps.addLast(Step(startTime + 4.18, EntityType.MetalBox, [0.82]));

    _steps.addLast(Step(startTime + 4.28, EntityType.Coin, [0.5]));
    _steps.addLast(Step(startTime + 4.36, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 4.46, EntityType.Coin, [0.4]));
    _steps.addLast(Step(startTime + 4.54, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 4.6, EntityType.WoodBox, [0.72]));
    _steps.addLast(Step(startTime + 4.64, EntityType.Coin, [0.3]));
    _steps.addLast(Step(startTime + 4.72, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 4.72, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 4.72, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(startTime + 4.82, EntityType.Coin, [0.2]));
    _steps.addLast(Step(startTime + 4.90, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 4.90, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 5, EntityType.Coin, [0.1]));
    _steps.addLast(Step(startTime + 5.08, EntityType.ElectricObstacle, [0.61]));
    _steps.addLast(Step(startTime + 5.21, EntityType.BonusHp, [0.1]));
    _steps.addLast(Step(startTime + 5.4, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 5.4, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 5.4, EntityType.Spikes, [0.61]));
    _steps.addLast(Step(startTime + 5.58, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 5.58, EntityType.MetalBox, [0.66]));
    _steps.addLast(Step(startTime + 5.75, EntityType.Rocket, [0.1]));
    _steps.addLast(Step(startTime + 5.76, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 5.76, EntityType.WoodBox, [0.72]));
    _steps.addLast(Step(startTime + 5.94, EntityType.MetalBox, [0.82]));
    _steps.addLast(Step(startTime + 6.12, EntityType.MetalBox, [0.82]));
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
}
