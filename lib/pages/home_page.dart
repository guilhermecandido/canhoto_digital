import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import '../widgets/shipping_form.dart';

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
            icon: Icon(
              Icons.logout,
              textDirection: ui.TextDirection.ltr,
              semanticLabel: 'Logout',
            ),
            onPressed: _logout,
          ),
        ),
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: ShippingForm()
    );
  }
}
