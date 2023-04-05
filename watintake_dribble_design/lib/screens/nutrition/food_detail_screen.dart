import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {
  final dynamic food;

  const FoodDetailScreen({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food['foodName']),
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
            _buildNutritionInfo('Calories', food['nfCalories'] ?? 0),
            _buildNutritionInfo('Serving Size', '${food['servingQty']} ${food['servingUnit']}'),
            _buildNutritionInfo('Brand', food['brandName'] ?? ''),
            _buildNutritionInfo('Region', food['region']?.toString() ?? ''),
            SizedBox(height: 20),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              food['brandNameItemName'] ?? '',
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
