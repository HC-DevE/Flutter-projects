import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  FontWeight fontWeight;
  SmallText(
      {super.key,
      this.color = AppColors.mainBlackColor,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 12,
      this.fontWeight = FontWeight.normal,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
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
