import 'dart:ui';

import 'package:chesterjetpack/screens/game/player/LifeTracker.dart';
import 'package:chesterjetpack/screens/game/player/ScoreHolder.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../EntitiesSizes.dart';
import '../story/StoryHandler.dart';
import 'BasePlayer.dart';

class Player extends BasePlayer {
  AnimationComponent _player;
  AnimationComponent _smoke;
  double _speed;
  double _maxSpeed;
  double _y;
  double _x;
  double _xSmokeOffset;

  double _topLimit;
  double _bottomLimit;

  bool _renderPlayer;
  bool _hitInProgress;
  DateTime _hitTime;

  LifeTracker _lifeTracker;
  ScoreHolder _scoreHolder;

  Player() {
    List<Sprite> sprites =
        [1, 2, 3, 4].map((e) => Sprite('player/${e}.png')).toList();
    _player = AnimationComponent(
        0,
        0,
        Animation.spriteList(
          sprites,
          stepTime: kPlayerAnimationSpeed,
        ));

    sprites = [1, 2, 3, 4].map((e) => Sprite('player/s${e}.png')).toList();
    _smoke = AnimationComponent(
        0,
        0,
        Animation.spriteList(
          sprites,
          stepTime: kPlayerAnimationSpeed,
        ));

    _speed = 0;
    _maxSpeed = 0;
    _y = 0;
    _x = 0;
    _xSmokeOffset = 0;

    _hitInProgress = false;
    _renderPlayer = true;

    _lifeTracker = LifeTracker();
    _scoreHolder = ScoreHolder();

    _topLimit = 0;
    _bottomLimit = 0;
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _speed = -_maxSpeed * 2;
  }

  @override
  void render(Canvas canvas) {
    if (_renderPlayer) {
      if (_speed < _maxSpeed) {
        canvas.save();
        _smoke.x = _x - _xSmokeOffset;
        _smoke.y = _y + _player.height * kPlayerSmokeYRatio;
        _smoke.render(canvas);
        canvas.restore();
      }
      canvas.save();
      _player.x = _x;
      _player.y = _y;
      _player.render(canvas);
      canvas.restore();
    }

    _lifeTracker.render(canvas);
    _scoreHolder.render(canvas);
  }

  @override
  void resize() {
    _maxSpeed = screenSize.height * kPlayerBumpSpeed;

    _xSmokeOffset = screenSize.width * kPlayerSmokeXOffset;
    _smoke.width = screenSize.width * kPlayerSmokeWidthRatio;
    _smoke.height = screenSize.height * kPlayerSmokeHeightRatio;

    _player.width = screenSize.width * kPlayerWidthRatio;
    _player.height = screenSize.height * kPlayerHeightRatio;

    _topLimit = screenSize.height * kBarHeightRatio;
    _bottomLimit = screenSize.height * kBarBottomYRatio - _player.height;

    _resetPlayerPosition();

    _lifeTracker.resize();
    _scoreHolder.resize();
  }

  @override
  void update(double t) {
    _updateSpeed(t);
    _updatePosition();

    _player.update(t);
    _smoke.update(t);

    _checkIfHit();
    _lifeTracker.update(t);
    _scoreHolder.update(t);
  }

  void _updatePosition() {
    _setYPosition(_speed + _y);
  }

  void _updateSpeed(double t) {
    _speed += t * _maxSpeed * 3;
    if (_speed > _maxSpeed) _speed = _maxSpeed;
  }

  void _checkIfHit() {
    var rect = _player.toRect();
    for (var e in storyHandler.entities) {
      if (e.overlaps(rect)) e.hit(this);
    }

    if (_hitInProgress) {
      int hitToggle =
          (DateTime.now().difference(_hitTime).inMilliseconds / 100).toInt();
      if (hitToggle > 10) {
        _hitInProgress = false;
        _renderPlayer = true;
      } else {
        if (hitToggle % 2 == 0) {
          _renderPlayer = false;
        } else {
          _renderPlayer = true;
        }
      }
    }
  }

  @override
  void hit() {
    if (!_hitInProgress) {
      _hitInProgress = true;
      _hitTime = DateTime.now();
      _lifeTracker.decreaseHp();
    }
  }

  @override
  void increaseHp() {
    _lifeTracker.increaseHp();
  }

  @override
  void collectCoin() {
    _scoreHolder.increaseScore(kCoinReward);
  }

  @override
  void pushBack(Rect rect) {
    // TODO: implement pushBack
  }

  void _setYPosition(double newValue) {
    if (newValue < _topLimit)
      newValue = _topLimit;
    else if (newValue > _bottomLimit) newValue = _bottomLimit;

    _y = newValue;
  }

  void _resetPlayerPosition() {
    _x = screenSize.width * kPlayerXRatio;
    _setYPosition((screenSize.height - _player.height) / 2);
  }
}
