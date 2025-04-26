import 'package:audioplayers/audioplayers.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';

class AudioService {
  static final AudioCache _player = AudioCache();

  static AudioCache get player => _player;

  static Future<Uri> play(String asset) async {
    return await _player.load(asset);
  }

  static void playSelect() async {
    await play(Assets.audio_select);
  }

  static void playDelete() async {
    await play(Assets.audio_delete);
  }
}
