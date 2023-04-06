import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  Common commonFood = Get.arguments ;
  // Branded brandedFood = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Text(commonFood.foodName.toString().toUpperCase()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Nutritional Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildNutritionInfo('Calories', 'nfCalories'),
            _buildNutritionInfo(
                'Serving Size',
                "servingQty, servingUnit"),
            _buildNutritionInfo('Brand', 'brandName'),
            _buildNutritionInfo("Region", 'region'),
            SizedBox(height: 20),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
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
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
