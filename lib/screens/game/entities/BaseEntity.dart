import 'dart:ui';

import 'package:chesterjetpack/screens/BaseWidget.dart';

abstract class BaseEntity extends BaseWidget {
  bool isDead();

  void hit();

  bool overlaps(Rect rect);
}
