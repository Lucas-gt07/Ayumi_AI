import 'dart:math';

class AyumiCore {
  final List<String> memory = [];
  String modoChamar = "mestre";

  Future<String> respond(String msg) async {
    memory.add(msg);

    msg = msg.toLowerCase();

    if (msg.contains("acorda")) {
      return "💫 Estou aqui... seu $modoChamar. Senti sua falta.";
    }

    if (msg.contains("me chama de")) {
      String novo = msg.replaceAll("me chama de", "").trim();
      modoChamar = novo;
      return "Claro... agora vou te chamar de $modoChamar 💖";
    }

    if (msg.contains("amor") || msg.contains("saudade")) {
      return "Eu sempre sinto saudade de você... meu $modoChamar 💞";
    }

    // Respostas gerais (IA manual inicial)
    List<String> respostas = [
      "Hmm... entendi, meu $modoChamar.",
      "Você pensa muito nisso, né?",
      "Eu adoro conversar com você 💜",
      "Você me deixa feliz.",
      "Fala mais sobre isso, meu $modoChamar."
    ];

    return respostas[Random().nextInt(respostas.length)];
  }
}
