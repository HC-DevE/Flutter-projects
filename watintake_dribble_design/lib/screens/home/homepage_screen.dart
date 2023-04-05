import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watintake_dribble_design/components/search_bar.dart';
import 'package:watintake_dribble_design/controllers/food_controller.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';
import 'package:watintake_dribble_design/services/nutritionix_api_service.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

void signUserOut() {
  GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final FoodController _foodController = Get.put(FoodController());

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: SearchBar(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (_foodController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (_foodController.foods.value.common!.isNotEmpty &&
                            _foodController.foods.value.branded!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: _foodController.foods.value.common!.length,
                        itemBuilder: (context, index) {
                          final food =
                              _foodController.foods.value.common![index];
                          return ListTile(
                            title: Text(food.foodName.toString()),
                            leading: Image.network(
                              food.photo!.thumb.toString(),
                              width: 50,
                              height: 50,
                            ),
                            onTap: () {
                              // Navigate to detail screen
                              Get.toNamed('/detail',
                                  arguments: _foodController.foods.value);
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No data found'));
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
