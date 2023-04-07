import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';

import '../../constants/constants.dart';
import '../../widgets/app_icon.dart';

class CommonFoodDetailScreen extends StatefulWidget {
  const CommonFoodDetailScreen({Key? key}) : super(key: key);

  @override
  State<CommonFoodDetailScreen> createState() => _CommonFoodDetailScreenState();
}

class _CommonFoodDetailScreenState extends State<CommonFoodDetailScreen> {
  Common commonFood = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: Dimensions.popularFoodImgSize350,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      commonFood.photo!.thumb!,
                    ).image,
                  ),
                ),
              ),
            ),

            // icon widget
            Positioned(
              top: Dimensions.height20,
              left: Dimensions.width10,
              right: Dimensions.width10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                ],
              ),
            ),
            //introduction of food
            Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize350 - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.green[200],
                ),
                child: SizedBox(
                  height: Dimensions.screenHeight -
                      Dimensions.popularFoodImgSize350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nutritional Information',
                        style: TextStyle(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Container(
                        height: Dimensions.screenHeight * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius20,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              commonFood.foodName.toString(),
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[300]),
                            ),
                            _buildNutritionInfo(
                                'Serving Quantity :', commonFood.servingQty),
                            _buildNutritionInfo(
                                'Serving Unit :', commonFood.servingUnit),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionInfo(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xfff6cadd),
            ),
          ),
        ],
      ),
    );
  }
}
