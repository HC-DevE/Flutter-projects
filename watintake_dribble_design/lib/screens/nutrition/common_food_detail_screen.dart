import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                commonFood.photo!.thumb!,
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Text(commonFood.foodName.toString()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Nutritional Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildNutritionInfo('TagId', commonFood.tagId),
            _buildNutritionInfo('TagName', commonFood.tagName),
            _buildNutritionInfo('Serving Size', "servingQty, servingUnit"),
            _buildNutritionInfo('Brand', 'brandName'),
            _buildNutritionInfo("Region", commonFood.locale),
            const SizedBox(height: 20),
            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'brandName ItemName',
              style: TextStyle(fontSize: 16),
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
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
