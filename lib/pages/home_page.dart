import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text_form.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cpf');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RotatedBox(
          quarterTurns: 2,
          child: IconButton(
            icon: const Icon(
              Icons.logout,
              textDirection: TextDirection.ltr,
              semanticLabel: 'Logout',
            ),
            onPressed: _logout,
          ),
        ),
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomTextForm(
              keyboardType: TextInputType.text,
              hintText: 'Placa do Veículo',
              prefixicon: const Icon(
                Icons.local_shipping,
                color: Color(0x660b4257),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
