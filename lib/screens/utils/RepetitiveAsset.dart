import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

import 'SizeHolder.dart';

class RepetitiveAsset extends BaseWidget {
  final double _speed;

  SpriteComponent _asset;

  double _x;

  final double _hRatio;
  final double _yRatio;

  RepetitiveAsset(this._hRatio, this._yRatio, this._speed, String imgSrc) {
    _asset = SpriteComponent.fromSprite(0, 0, Sprite(imgSrc));
    _x = 0;
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    _asset.x = _x + screenSize.width * 0.995;
    _asset.render(canvas);
    canvas.restore();

    canvas.save();
    _asset.x = _x;
    _asset.render(canvas);
    canvas.restore();
  }

  @override
  void resize() {
    _asset.width = screenSize.width;
    _asset.height = screenSize.height * _hRatio;
    _asset.y = screenSize.height * _yRatio;
  }

  @override
  void update(double t) {
    _x -= t * _speed * screenSize.width;
    if (_x < -screenSize.width * 0.995) _x += screenSize.width * 0.995;
  }
}
