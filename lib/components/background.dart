import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff0b4257),
            Color(0xcc0b4257),
            Color(0x990b4257),
            Color(0x660b4257),
          ],
        ),
      ),
    );
  }
}
