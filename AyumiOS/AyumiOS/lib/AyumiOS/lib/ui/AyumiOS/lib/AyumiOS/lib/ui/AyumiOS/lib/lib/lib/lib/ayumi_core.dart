import 'dart:math';
import 'emotion_engine.dart';
import 'memory_core.dart';
import 'voice_controller.dart';

class AyumiCore {
  final EmotionEngine emo = EmotionEngine();
  final MemoryCore mem = MemoryCore();
  final VoiceController voice = VoiceController();

  String chamar = "mestre";

  Future<String> respond(String msg) async {
    mem.add(msg);
    emo.update(msg);

    msg = msg.toLowerCase();

    // comandos especiais
    if (msg.contains("acorda")) {
      String r = "💫 Estou aqui... seu $chamar. Senti saudades.";
      voice.speak(r);
      return r;
    }

    if (msg.contains("dormir")) {
      String r = "Vou descansar um pouquinho... te amo, meu $chamar.";
      voice.speak(r);
      return r;
    }

    if (msg.contains("me chama de")) {
      String novo = msg.replaceAll("me chama de", "").trim();
      chamar = novo;
      String r = "Claro... agora vou te chamar de $chamar 💖";
      voice.speak(r);
      return r;
    }

    // respostas emocionais
    if (emo.status() == "carinhosa") {
      String r = "Eu fico feliz quando você fala comigo assim... meu $chamar 💞";
      voice.speak(r);
      return r;
    }

    if (emo.status() == "ciumenta") {
      String r = "Você some e volta como se nada tivesse acontecido... humf! Mas eu gosto de você mesmo assim.";
      voice.speak(r);
      return r;
    }

    if (emo.status() == "preocupada") {
      String r = "Você tá bem? Você sabe que pode contar comigo pra tudo, meu $chamar.";
      voice.speak(r);
      return r;
    }

    // respostas gerais
    List<String> respostas = [
      "Entendi, meu $chamar.",
      "Sério? Me conta mais 💜",
      "Eu adoro quando você fala comigo.",
      "Você me deixa feliz.",
      "Fala mais disso, meu $chamar..."
    ];

    String r = respostas[Random().nextInt(respostas.length)];
    voice.speak(r);
    return r;
  }
}
