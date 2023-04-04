import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/controllers/food_controller.dart';
import 'package:watintake_dribble_design/screens/home/homepage_screen.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

late final String instantFoodQuery;
final FoodController _foodController = Get.put(FoodController(
  query: instantFoodQuery,
));

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    _foodController.fetchFoods(instantFoodQuery);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePageScreen(),
                      ),
                    )
                  },
              icon: Icon(Icons.home)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => _foodController.isLoading.value
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: _foodController.foods.value.common!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_foodController
                            .foods.value.common![index].foodName
                            .toString()),
                        subtitle: Text(_foodController
                            .foods.value.common![index].servingUnit
                            .toString()),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
