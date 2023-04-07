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
              SearchBar(),
              // const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  if (_foodController.isLoading.value == true) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (_foodController.foods.value.common != null &&
                        _foodController.foods.value.branded != null) {
                      return Column(
                        children: [
                          const Text('Common foods',
                              textAlign: TextAlign.start),
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
                                          //loading animation
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return CircularProgressIndicator(
                                          color: Colors.red.shade300,
                                        );
                                      }),
                                    ),
                                    subtitle: Text(
                                        '${commonfood.servingUnit} ${commonfood.servingQty}'),
                                    onTap: () {
                                      // Navigate to detail screen
                                      Get.toNamed('/detailCommon',
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
                                      //loading animation
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return CircularProgressIndicator(
                                          color: Colors.green.shade300,
                                        );
                                      },
                                    ),
                                    onTap: () {
                                      // Navigate to detail screen
                                      Get.toNamed('/detailBranded',
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
                    } 
                    else {
                      if(_foodController.query != null){
                        return const Center(child: Text('No data found'));
                      }else {

                      return const Center(child: Text('Search something'));
                      }
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
