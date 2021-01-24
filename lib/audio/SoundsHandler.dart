import 'package:audioplayers/audioplayers.dart';
import 'package:chesterjetpack/screens/game/data/UserData.dart';
import 'package:flame/flame.dart';

SoundsHandler soundsHandler = SoundsHandler();

class SoundsHandler {
  bool _isMusicPlaying = false;
  AudioPlayer _audioPlayer;

  void playExplosion() async {
    try {
      if (userData.shallPlayMusic()) {
        await Flame.audio.play('explosion.ogg');
      }
    } catch (Exception) {}
  }

  Future<void> update() async {
    try {
      Flame.audio.disableLog();
      if (_isMusicPlaying) {
        if (!userData.shallPlayMusic()) {
          _isMusicPlaying = false;
          if (_audioPlayer != null) {
            _audioPlayer.stop();
          }
        }
      } else {
        if (userData.shallPlayMusic()) {
          _isMusicPlaying = true;
          _audioPlayer =
              await Flame.audio.playLongAudio('background_music.mp3');
          _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
        } else {
          if (_audioPlayer != null) {
            _audioPlayer.stop();
          }
        }
      }
    } catch (Exception) {}
  }

  void resume() {
    try {
      if (userData.shallPlayMusic() && _audioPlayer != null) {
        _audioPlayer.resume();
      }
    } catch (Exception) {}
  }

  void pause() {
    try {
      if (userData.shallPlayMusic() && _audioPlayer != null) {
        _audioPlayer.pause();
      }
    } catch (Exception) {}
  }
}
