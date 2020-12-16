import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';
import 'package:chesterjetpack/screens/game/player/BasePlayer.dart';

abstract class BaseEntity extends BaseWidget {
  bool isDead();

  void hit(BasePlayer player);

  bool overlaps(Rect rect);

  Rect getSurface();
}
