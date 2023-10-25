import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? prefixText;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;

  const InputTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixText,
    this.suffixText,
    this.inputFormatters,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixText: prefixText,
        suffixText: suffixText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
