import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/components/my_text_field.dart';
import 'package:watintake_dribble_design/controllers/food_controller.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchInputController = TextEditingController();
  final FoodController _foodController = Get.put(FoodController());

  @override
  void dispose() {
    _searchInputController.dispose();
    _foodController.clearFoods();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
              onChanged: (value) {
                if (value.length >= 3) {
                  _foodController.fetchFoods(value);
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
    );
  }
}
