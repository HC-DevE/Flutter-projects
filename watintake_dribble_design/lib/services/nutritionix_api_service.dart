import 'package:watintake_dribble_design/constants/constants.dart';
import 'package:watintake_dribble_design/models/exercise_model.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';
import 'package:http/http.dart' as http;

import '../constants/user_model.dart';

class NutritionixService {
  static Future<FoodModel> fetchFood(String query) async {
    final response = await http.get(
      Uri.parse(NutritionixApiUrls.baseUrl +
          NutritionixApiUrlEndpoints.instantSearch +
          query),
      headers: {
        "x-app-id": NutritionixApiUrls.appID,
        "x-app-key": NutritionixApiUrls.appKey,
        "x-remote-user-id": "0",
      },
    );
    if (response.statusCode == 200) {
      return foodFromJson(response.body);
    } else {
      throw Exception('Failed to load food');
    }
  }

  static Future<Exercise> fetchExercise(String exercise, String? gender,
      String? weight, String? height, String? age) async {
    final response = await http.post(
        Uri.parse(
            NutritionixApiUrls.baseUrl + NutritionixApiUrlEndpoints.exercice),
        headers: {
          "x-app-id": NutritionixApiUrls.appID,
          "x-app-key": NutritionixApiUrls.appKey,
          "x-remote-user-id": "0",
        },
        body: {
          {
            "query": exercise,
            "gender": gender ?? '',
            "weight_kg": weight ?? '',
            "height_cm": height ?? '',
            "age": age ?? ''
          }
        });
    if (response.statusCode == 200) {
      return exerciseFromJson(response.body);
    } else {
      throw Exception('Failed to load food');
    }
  }

  static Future<User> fetchCurrentUserData(String? userToken) async {
    final response = await http.get(
      Uri.parse(
          NutritionixApiUrls.baseUrl + NutritionixApiUrlEndpoints.userData),
      headers: {
        // "x-app-id": NutritionixApiUrls.appID,
        // "x-app-key": NutritionixApiUrls.appKey,
        // "x-remote-user-id": "0",
        "x-user-jwt": userToken ?? NutritionixUserData.userToken.toString(),
      },
    );
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      throw Exception('Failed to load food');
    }
  }
}
