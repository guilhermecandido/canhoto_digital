import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextForm extends StatelessWidget {
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String hintText;
  final Widget prefixicon;

  const CustomTextForm(
      {super.key,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      required this.keyboardType,
      required this.hintText,
      required this.prefixicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
