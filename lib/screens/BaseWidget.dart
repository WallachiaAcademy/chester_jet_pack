import 'dart:ui';

abstract class BaseWidget {
  void resize(Size size);

  void render(Canvas canvas);

  void update();
}
