import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game/EntitiesSizes.dart';
import 'package:chesterjetpack/screens/utils/StaticText.dart';
import 'package:flutter/src/gestures/tap.dart';

class ScoreHolder extends BaseWidget {
  StaticText _staticText;
  double _score = 0;

  ScoreHolder() {
    _staticText = StaticText(
      Color(0xffffcc00),
      Color(0xff000000),
      kScoreFontRatio,
      kScoreXRatio,
      kScoreYRatio,
      TextAnchor.RightTop,
    );
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    _staticText.render(canvas);
  }

  @override
  void resize() {
    _staticText.resize();
  }

  @override
  void update(double t) {
    _score += t * 2;
    _staticText.update(_score.toInt().toString());
  }

  void increaseScore(double reward) {
    _score += reward;
  }

  int getScore() {
    return _score.toInt();
  }
}
