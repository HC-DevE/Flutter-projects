//create a search input field
// Path: watintake_dribble_design\lib\components\search_bar.dart
// Compare this snippet from watintake_dribble_design\lib\components\search_bar.dart:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/components/my_text_field.dart';
import 'package:watintake_dribble_design/controllers/food_controller.dart';

class SearchBar extends StatefulWidget {
  // final Function(String)? onChanged;
  // final Function()? onTap;
  SearchBar({
    super.key,
    // this.onChanged,
    // this.onTap
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchInputController = TextEditingController();

  final FoodController _foodController = Get.put(FoodController());

  @override
  void dispose() {
    _searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyTextField(
                        controller: _searchInputController,
                        onTextChanged: (value) {
                          if (value.length >= 3) {
                            _foodController.fetchFoods(value);
                            print(value);
                          }
                        },
                        hintText: 'Search foods',
                        isPassword: false,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.filter_list),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (_foodController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: _foodController.foods.value.common!.length,
                    itemBuilder: (context, index) {
                      final food = _foodController.foods.value.common![index];
                      return ListTile(
                        title: Text(food.foodName.toString()),
                        leading: Image.network(
                          food.photo!.thumb.toString(),
                          width: 50,
                          height: 50,
                        ),
                        onTap: () {
                          // Navigate to detail screen
                        },
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
