import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/components/search_bar.dart';
import 'package:watintake_dribble_design/controllers/food_controller.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

final FoodController _foodController = Get.put(FoodController());

class _SearchBarScreenState extends State<SearchBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: SearchBar(),
              ),
              // const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  if (_foodController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (_foodController.foods.value.common!.isNotEmpty &&
                        _foodController.foods.value.branded!.isNotEmpty) {
                      return Column(
                        children: [
                          const Text('Common foods', textAlign: TextAlign.start),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  _foodController.foods.value.common!.length,
                              itemBuilder: (context, index) {
                                final commonfood =
                                    _foodController.foods.value.common![index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Text(commonfood.foodName.toString()),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        commonfood.photo!.thumb.toString(),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    subtitle: Text(
                                        '${commonfood.servingUnit} ${commonfood.servingQty}'),
                                    onTap: () {
                                      // Navigate to detail screen
                                      // Get.toNamed('/detail', arguments:{ 'foods': _foodController.foods.value, 'selectedIndex': index});
                                      Get.toNamed('/detail',
                                          arguments: commonfood);
                                      // Navigator.pushNamed(context, '/detail');
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(),
                          const Text('Branded foods'),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  _foodController.foods.value.branded!.length,
                              itemBuilder: (context, index) {
                                final brandedfood =
                                    _foodController.foods.value.branded![index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    trailing:
                                        Text('${brandedfood.nfCalories} cal'),
                                    title:
                                        Text(brandedfood.foodName.toString()),
                                    leading: Image.network(
                                      brandedfood.photo!.thumb.toString(),
                                      width: 50,
                                      height: 50,
                                    ),
                                    onTap: () {
                                      // Navigate to detail screen
                                      // Get.toNamed('/detail', arguments:{ 'foods': _foodController.foods.value, 'selectedIndex': index});
                                      Get.toNamed('/detail',
                                          arguments: brandedfood);
                                      // Navigator.pushNamed(context, '/detail');
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      if (_foodController.foods.value.common!.isEmpty &&
                          _foodController.foods.value.branded!.isEmpty) {
                        return const Center(child: Text('No data found'));
                      } else {
                        return const Center(child: Text('No data found'));
                      }
                      // return const Center(child: Text('No data found'));
                    }
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
