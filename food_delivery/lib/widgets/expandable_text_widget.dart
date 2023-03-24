import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/nutritionix_api.service.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.height50 * 2;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > Dimensions.height50) {
      firstHalf = widget.text.substring(0, Dimensions.height50.toInt());
      secondHalf = widget.text
          .substring(Dimensions.height50.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  late String nutritionDataResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: textHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(
              text: hiddenText ? '$firstHalf...' : '$firstHalf$secondHalf',
              color: AppColors.paraColor),
          SizedBox(height: Dimensions.height10),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
                textHeight = hiddenText
                    ? Dimensions.height50 * 2
                    : Dimensions.height50 * 3;
              });
            },
            child: Row(
              children: [
                SmallText(
                  text: hiddenText ? 'Show more' : 'Show less',
                  color: AppColors.mainColor,
                ),
                SizedBox(width: Dimensions.width10 / 2),
                Icon(
                  hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                  size: Dimensions.iconSize16,
                  color: AppColors.mainColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
