import 'package:flutter/material.dart';
import 'package:ayumios/core/ayumi_core.dart';
import 'message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AyumiCore ayumi = AyumiCore();
  final TextEditingController controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  void send() async {
    String text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "msg": text});
    });

    controller.clear();

    String reply = await ayumi.sendMessage(text);

    setState(() {
      messages.add({"sender": "ayumi", "msg": reply});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AyumiOS"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  isUser: messages[index]["sender"] == "user",
                  text: messages[index]["msg"]!,
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      hintText: "Digite sua mensagem..."),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: send,
              )
            ],
          )
        ],
      ),
    );
  }
}
