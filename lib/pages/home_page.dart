import 'package:canhoto_digital_faxon_v2/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import '../widgets/custom_text_form.dart';


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
            const SizedBox(height: 15),
            DatePickerForm(
              hintText: 'Data da entrega',
              prefixicon: Icon(
                Icons.calendar_month, 
                color: Color(0x660b4257),
              ), 
            ),
            const SizedBox(height: 15),
            CustomTextForm(
              keyboardType: TextInputType.number,
              hintText: 'NF-e',
              prefixicon: const Icon(
                Icons.receipt,
                color: Color(0x660b4257),
              ),
              // suffixIcon: IconButton(
              //     icon: Icon(Icons.document_scanner_outlined, size: 35),
              //     onPressed: (),
              // ),
            ),
            // ElevatedButton(onPressed: onPressed, child:),
            const SizedBox(height: 15),
          ]
        ),
      ),
    );
  }
}
