import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/gestures/tap.dart';

class Controller extends BaseWidget {
  final double _xRatio;
  final double _yRatio;
  final double _wRatio;
  final double _hRatio;

  SpriteComponent spriteComponent;

  Controller(
      this._xRatio, this._yRatio, this._wRatio, this._hRatio, String src) {
    spriteComponent = SpriteComponent.fromSprite(0, 0, Sprite(src));
  }
  @override
  void render(Canvas canvas) {
    canvas.save();
    spriteComponent.render(canvas);
    canvas.restore();
  }

  @override
  void resize(Size size) {
    spriteComponent.x = size.width * _xRatio;
    spriteComponent.y = size.height * _yRatio;
    spriteComponent.width = size.width * _wRatio;
    spriteComponent.height = size.height * _hRatio;
  }

  @override
  void update() {
    // TODO: implement update
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    var pos = detail.globalPosition;
    if (pos.dx >= spriteComponent.x &&
        pos.dx <= spriteComponent.x + spriteComponent.width) {
      if (pos.dy >= spriteComponent.y &&
          pos.dy <= spriteComponent.y + spriteComponent.height) {
        fn();
      }
    }
  }
}
