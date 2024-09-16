import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {

  final TextEditingController controller;
  final void Function(String) onChange;
  const PasswordInput(
      {super.key, required this.controller, required this.onChange});


  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: _togglePasswordVisibility,
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
      controller: widget.controller,
      onChanged: widget.onChange,
    );
  }
}
