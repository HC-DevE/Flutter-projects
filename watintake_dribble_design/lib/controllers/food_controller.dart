import 'package:get/get.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';
import 'package:watintake_dribble_design/services/nutritionix_api_service.dart';

class FoodController extends GetxController {
  var foods = FoodModel().obs;
  var isLoading = true.obs;

  late String query;

  @override
  void onInit() {
    super.onInit();
    fetchFoods(query);
  }

  void fetchFoods(String query) async {
    try {
      isLoading(true);
      var foodsTemp = await NutritionixService.fetchFood(query);
      if (foodsTemp != null) {
        foods.value = foodsTemp;
      }
    } finally {
      isLoading(false);
    }
  }
}
