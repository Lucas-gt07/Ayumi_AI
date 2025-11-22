import 'package:flutter/material.dart';

class AyumiAvatar extends StatelessWidget {
  const AyumiAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage("assets/ayumi.png"),
          ),
          SizedBox(height: 10),
          Text(
            "Ayumi",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
