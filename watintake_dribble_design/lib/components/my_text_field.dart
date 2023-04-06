import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.isPassword,
    this.onChanged,
    this.suffixIcon, this.prefixIcon,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff70BDF2)),
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
