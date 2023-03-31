import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
            text: text,
            size: Dimensions.font26,
            color: AppColors.mainBlackColor,
            fontWeight: FontWeight.w500),
        const SizedBox(height: 10),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                    (index) => const Icon(Icons.star,
                        color: AppColors.mainColor, size: 15))),
            const SizedBox(width: 10),
            SmallText(
              text: '4.5',
              color: AppColors.mainBlackColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 10),
            SmallText(
              text: '1257',
              color: Colors.black54,
            ),
            const SizedBox(width: 10),
            SmallText(
              text: 'comments',
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
                text: 'Normal',
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                text: '1.7km',
                icon: Icons.location_pin,
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                text: '32min',
                icon: Icons.watch_later_outlined,
                iconColor: AppColors.iconcolor2),
          ],
        ),
      ],
    );
  }
}
