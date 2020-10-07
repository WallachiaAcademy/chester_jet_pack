import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class RepetitiveAsset extends BaseWidget {
  final double _speed;

  SpriteComponent _asset;

  double _x;

  final double _hRatio;
  final double _yRatio;

  Size _size;

  RepetitiveAsset(this._hRatio, this._yRatio, this._speed, String imgSrc) {
    _asset = SpriteComponent.fromSprite(0, 0, Sprite(imgSrc));
    _x = 0;
    _size = Size(0, 0);
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    _asset.x = _x + _size.width * 0.995;
    _asset.render(canvas);
    canvas.restore();

    canvas.save();
    _asset.x = _x;
    _asset.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Size size) {
    this._size = size;
    _asset.width = size.width;
    _asset.height = size.height * _hRatio;
    _asset.y = size.height * _yRatio;
  }

  @override
  void update(double t) {
    _x -= t * _speed * _size.width;
    if (_x < -_size.width * 0.995) _x += _size.width * 0.995;
  }
}
