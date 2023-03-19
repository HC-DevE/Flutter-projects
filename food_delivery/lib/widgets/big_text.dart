import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  BigText(
      {super.key,
      this.color = AppColors.mainBlackColor,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'Schyler',
      ),
    );
  }
}
