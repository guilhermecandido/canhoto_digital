import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerButton extends StatefulWidget {
  final TextEditingController nfeController;
  const ScannerButton({super.key, required this.nfeController});

  @override
  State<ScannerButton> createState() => _ScannerButtonState();
}

class _ScannerButtonState extends State<ScannerButton> {
  //Scan
  barcodescan() async {
    String ticket = '';
    String nfeCode = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "Cancelar", false, ScanMode.BARCODE);

    setState(() => ticket = nfeCode != '-1' ? nfeCode : 'Inválido');
    widget.nfeController.text = nfeCode;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => barcodescan(),
      icon: Icon(Icons.document_scanner_outlined, size: 35),
      label: Text('Escanear código de barras'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        backgroundColor: const Color(0x660b4257),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
