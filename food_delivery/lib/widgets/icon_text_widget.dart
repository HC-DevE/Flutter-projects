import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  const IconAndTextWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 5),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
