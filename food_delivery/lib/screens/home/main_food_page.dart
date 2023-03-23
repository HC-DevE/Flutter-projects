import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/food_page_body.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          //showing the header
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height20, vertical: Dimensions.height20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Food Delivery',
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
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
          ),
          //showing the body
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      )),
    );
  }
}
