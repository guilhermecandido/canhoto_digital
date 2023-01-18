import 'package:canhoto_digital_faxon_v2/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

Widget loginHeader() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          'lib/assets/images/logo.png',
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      const Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
