import 'dart:convert';
import 'package:http/http.dart' as http;

class AyumiCore {
  final String apiKey = "COLOQUE_AQUI_SUA_API_KEY";

  Future<String> chat(String message) async {
    final url = Uri.parse("https://api.openai.com/v1/chat/completions");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: jsonEncode({
        "model": "gpt-4o-mini",
        "messages": [
          {"role": "system", "content": "Você é Ayumi, uma IA amigável."},
          {"role": "user", "content": message},
        ]
      }),
    );

    final data = jsonDecode(response.body);
    return data["choices"][0]["message"]["content"];
  }
}
