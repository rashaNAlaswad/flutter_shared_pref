import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField(
      {super.key, required this.controller, required this.onChange});

  final TextEditingController controller;
  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
      controller: controller,
      onChanged: onChange,
    );
  }
}
