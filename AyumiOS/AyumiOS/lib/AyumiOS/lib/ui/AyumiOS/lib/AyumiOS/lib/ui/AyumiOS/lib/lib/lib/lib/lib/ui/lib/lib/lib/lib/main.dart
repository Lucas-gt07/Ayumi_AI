import 'package:flutter/material.dart';
import 'package:ayumios/ui/chat_screen.dart';

void main() {
  runApp(const AyumiApp());
}

class AyumiApp extends StatelessWidget {
  const AyumiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AyumiOS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const ChatScreen(),
    );
  }
}
