import 'package:canhoto_digital_faxon_v2/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import '../widgets/custom_text_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ticket = '';
  final TextEditingController _controller = TextEditingController();

  _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cpf');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true);
  }

  barcodescan() async {
    String nfeCode = await FlutterBarcodeScanner.scanBarcode("#FFFFFF", "Cancelar", false, ScanMode.BARCODE);

    setState(() => ticket = nfeCode != '-1' ? nfeCode : 'Inválido');
    _controller.text = nfeCode;
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
        child: Column(children: [
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
              controller: _controller,
              keyboardType: TextInputType.number,
              hintText: 'NF-e',
              prefixicon: const Icon(
                Icons.receipt,
                color: Color(0x660b4257),
              ),
              
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () => barcodescan(),
              icon: Icon(Icons.document_scanner_outlined, size: 35),
              label: Text('Escanear código de barras'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                backgroundColor: const Color(0x660b4257),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
