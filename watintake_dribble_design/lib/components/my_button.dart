import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  Function()? onPressed;

  MyButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          // color: Color(0XFFA8DFF1),
          // color: Color(0XFF73B0CD),
          // color: Color(0XFF3D7C98),
          color: const Color(0xff70BDF2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
