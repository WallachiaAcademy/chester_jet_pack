import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/utils/SizeHolder.dart';
import 'package:chesterjetpack/screens/utils/StaticText.dart';
import 'package:flame/palette.dart';
import 'package:flutter/src/gestures/tap.dart';

class LoadingScreen extends BaseWidget {
  static const skyBlue = PaletteEntry(Color(0xFF6699ff));
  StaticText _loadingText;
  LoadingScreen() {
    _loadingText = StaticText(
      Color(0xffffcc00),
      Color(0xff000000),
      0.1,
      0.5,
      0.5,
      TextAnchor.Center,
    );
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, screenSize.width, screenSize.height),
      skyBlue.paint,
    );
    _loadingText.render(canvas);
  }

  @override
  void resize() {
    _loadingText.resize();
    _loadingText.update("Loading...");
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
