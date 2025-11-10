import 'package:flutter/material.dart';
import '../ayumi_core.dart';
import '../ui/ayumi_avatar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AyumiCore ayumi = AyumiCore();
  final TextEditingController controller = TextEditingController();
  List<Map<String, String>> messages = [];

  void sendMessage() async {
    String userMsg = controller.text.trim();
    if (userMsg.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "msg": userMsg});
      controller.clear();
    });

    String reply = await ayumi.respond(userMsg);

    setState(() {
      messages.add({"sender": "ayumi", "msg": reply});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AyumiAvatar(),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, i) {
                  bool isUser = messages[i]["sender"] == "user";
                  return Container(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(4),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUser
                            ? Colors.purpleAccent.withOpacity(0.4)
                            : Colors.white10,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        messages[i]["msg"]!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Diga algo para a Ayumi...",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.purpleAccent),
                    onPressed: sendMessage,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
