import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.controller,
    required this.onChanged,
    required this.labelText,
    this.hintText,
    this.textInputAction,
    this.readOnly = false,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final String labelText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      obscureText: _obscureText,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: widget.readOnly ? null : _toggleVisibility,
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          tooltip: _obscureText ? 'Tampilkan password' : 'Sembunyikan password',
        ),
      ),
    );
  }
}
