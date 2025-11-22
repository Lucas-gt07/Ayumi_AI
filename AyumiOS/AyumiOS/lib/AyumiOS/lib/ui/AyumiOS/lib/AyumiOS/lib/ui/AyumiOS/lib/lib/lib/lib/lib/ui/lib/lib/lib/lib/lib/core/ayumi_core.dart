import 'dart:convert';
import 'package:http/http.dart' as http;

class AyumiCore {
  final String systemPrompt = """
Você é a Ayumi, uma IA gentil e avançada criada para ajudar o Lucas.
Responda sempre de forma clara, carinhosa e útil.
""";

  Future<String> sendMessage(String userText) async {
    final response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer SUA_API_KEY_AQUI"
      },
      body: jsonEncode({
        "model": "gpt-4o",
        "messages": [
          {"role": "system", "content": systemPrompt},
          {"role": "user", "content": userText}
        ]
      }),
    );

    final data = jsonDecode(response.body);
    return data["choices"][0]["message"]["content"];
  }
}
