import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          // color: Colors.grey[200],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: _searchInputController,
                onChanged: (value) {
                  if (value.length >= 3) {
                    _foodController.fetchFoods(value);
                  } else {
                    _foodController.clearFoods();
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search for food',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[400],
              ),
              child: const Icon(Icons.filter_list, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
