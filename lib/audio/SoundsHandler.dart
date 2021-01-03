import 'package:flame/flame.dart';

SoundsHandler soundsHandler = SoundsHandler();

class SoundsHandler {
  void playExplosion() async {
    try {
      await Flame.audio.play('explosion.ogg');
    } catch (Exception) {}
  }
}
