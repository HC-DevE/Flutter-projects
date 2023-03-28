import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //showing the header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical:45),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Best Food',
                      size: 25,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Find the best food & drinks',
                          color: Colors.black54,
                        ),
                        const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.black54,
                        ),
                      ],
                      
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  
                )
              ]),
        ),
        //showing the body
        const FoodPageBody(),
        
      ],
    ));
  }
}
