import 'package:flutter_tts/flutter_tts.dart';

class VoiceController {
  final FlutterTts tts = FlutterTts();

  Future<void> speak(String text) async {
    await tts.setLanguage("pt-BR");
    await tts.setPitch(1.1);    // voz fofa
    await tts.setSpeechRate(0.93);
    await tts.speak(text);
  }
}
