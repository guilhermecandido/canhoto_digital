import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerForm extends StatelessWidget {
  final String hintText;
  final Widget prefixicon;
  const DatePickerForm({super.key, required this.hintText, required this.prefixicon});

  
  @override
  Widget build(BuildContext context) {
    TextEditingController _date = TextEditingController();
    return TextField(
      controller: _date,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.only(top: 14),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        prefixIcon: prefixicon,
      ),
      onTap: () async {
        DateTime? pickeddate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if(pickeddate != null) {
            _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
        }
      },
    );
  }
}