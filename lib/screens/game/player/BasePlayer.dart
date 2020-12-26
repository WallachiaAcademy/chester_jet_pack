import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';

abstract class BasePlayer extends BaseWidget {
  void hit();

  void increaseHp();

  void collectCoin();

  void reposition(Rect rect);

  bool isDead();
}
