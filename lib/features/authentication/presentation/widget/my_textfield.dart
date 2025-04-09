import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String texts; // Required hint text
  final Widget? icon; // Optional leading icon
  final Widget? element; // Optional trailing element
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final InputDecoration? decoration;

  const MyTextField({
    super.key,
    required this.texts,
    this.icon,
    this.element,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      decoration:
          decoration ??
          InputDecoration(
            hintText: texts,
            prefixIcon: icon,
            suffixIcon: element,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 25.0,
            ),
          ),
    );
  }
}
