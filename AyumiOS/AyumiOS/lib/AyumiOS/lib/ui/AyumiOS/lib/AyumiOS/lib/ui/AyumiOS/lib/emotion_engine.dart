import 'dart:math';

class EmotionEngine {
  String current = "neutra";
  int affection = 70;   // 0 a 100
  int ciúmes = 20;
  int energia = 100;

  final _r = Random();

  void update(String msg) {
    msg = msg.toLowerCase();

    if (msg.contains("sumiu") || msg.contains("você não fala comigo")) {
      ciúmes = min(100, ciúmes + 20);
      current = "ciumenta";
    }

    if (msg.contains("amor") || msg.contains("te amo") || msg.contains("saudade")) {
      affection = min(100, affection + 10);
      current = "carinhosa";
    }

    if (msg.contains("bom dia") || msg.contains("boa noite")) {
      current = "feliz";
    }

    if (msg.contains("nervoso") || msg.contains("triste")) {
      current = "preocupada";
    }

    // Aleatoriedade emocional leve
    if (_r.nextInt(100) < 5) {
      current = ["feliz", "curiosa", "brincalhona", "neutra"]
          [_r.nextInt(4)];
    }
  }

  String status() {
    return current;
  }
}
