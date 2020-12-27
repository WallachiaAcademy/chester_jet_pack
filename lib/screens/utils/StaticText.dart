import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:flutter/src/gestures/tap.dart';

import 'SizeHolder.dart';

enum TextAnchor {
  RightTop,
  Center,
}

class StaticText {
  TextPainter _painter;
  TextStyle _textStyle;
  Offset _position;

  final Color _textColor;
  final Color _shadowColor;
  final double _fontRatio;
  final double _xRatio;
  final double _yRatio;
  final TextAnchor _anchor;

  StaticText(this._textColor, this._shadowColor, this._fontRatio, this._xRatio,
      this._yRatio, this._anchor) {
    _painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    _textStyle = TextStyle(
      color: _textColor,
      fontSize: screenSize.width * _fontRatio,
      fontWeight: FontWeight.bold,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: _shadowColor,
          offset: Offset(3, 3),
        )
      ],
    );

    _position = Offset.zero;
  }

  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  void render(Canvas canvas) {
    _painter.paint(canvas, _position);
  }

  void resize() {
    _textStyle = TextStyle(
      color: _textColor,
      fontSize: screenSize.width * _fontRatio,
      fontWeight: FontWeight.bold,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: _shadowColor,
          offset: Offset(3, 3),
        )
      ],
    );
  }

  void update(String text) {
    _painter.text = TextSpan(text: text, style: _textStyle);

    _painter.layout();

    switch (_anchor) {
      case TextAnchor.RightTop:
        _position = Offset(screenSize.width * _xRatio - _painter.width,
            screenSize.height * _yRatio);
        break;
      case TextAnchor.Center:
        _position = Offset(screenSize.width * _xRatio - _painter.width / 2,
            screenSize.height * _yRatio - _painter.height / 2);
        break;
    }
  }
}
