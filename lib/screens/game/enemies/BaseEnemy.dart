import 'dart:ui';

import 'package:chesterjetpack/screens/BasedTimedWidget.dart';

abstract class BaseEnemy extends BaseTimedWidget {
  bool isDead();

  void hit();

  bool overlaps(Rect rect);
}
