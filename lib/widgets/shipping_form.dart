import 'package:canhoto_digital_faxon_v2/components/scanner_button.dart';
import 'package:flutter/material.dart';
import 'custom_text_form.dart';
import 'date_picker.dart';

class ShippingForm extends StatefulWidget {
  const ShippingForm({super.key});

  @override
  State<ShippingForm> createState() => _ShippingFormState();
}
final TextEditingController _controller = TextEditingController();
class _ShippingFormState extends State<ShippingForm> {

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            controller: _controller,
            keyboardType: TextInputType.number,
            hintText: 'NF-e',
            prefixicon: const Icon(
              Icons.receipt,
              color: Color(0x660b4257),
            ),
          ),
          const SizedBox(height: 15),
          ScannerButton(nfeController: _controller),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
