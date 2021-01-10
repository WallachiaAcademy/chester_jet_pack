import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/utils/Controller.dart';
import 'package:flutter/src/gestures/tap.dart';

class PauseWidget extends BaseWidget {
  BaseWidget _bg;
  BaseWidget _resume;
  BaseWidget _surrender;

  final Function _onResume;
  final Function _onSurrender;

  PauseWidget(this._onResume, this._onSurrender) {
    _bg = Controller(0.25, 0.25, 0.5, 0.5, 'play_ground/pause_widget/bg.png');
    _resume = Controller(
        0.35, 0.325, 0.3, 0.15, 'play_ground/pause_widget/resume_button.png');
    _surrender = Controller(
        0.35, 0.5, 0.3, 0.15, 'play_ground/pause_widget/surrender_button.png');
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _resume.onTapDown(detail, _onResume);
    _surrender.onTapDown(detail, _onSurrender);
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    _resume.render(canvas);
    _surrender.render(canvas);
  }

  @override
  void resize() {
    _bg.resize();
    _resume.resize();
    _surrender.resize();
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
