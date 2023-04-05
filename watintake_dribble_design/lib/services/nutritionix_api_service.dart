import 'dart:convert';

import 'package:watintake_dribble_design/constants/constants.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';
import 'package:http/http.dart' as http;

class NutritionixService {

  static Future<FoodModel> fetchFood(String query) async {
    final response = await http.get(
      Uri.parse(NutritionixApiUrls.baseUrl +
          NutritionixApiUrlEndpoints.instantSearch +
          query),
      headers: {
        "x-app-id": "974f7c64",
        "x-app-key": "10afb9cf91dc5301ae8046bc81e9daf4",
        "x-remote-user-id": "0",
      },
    );
    if (response.statusCode == 200) {
      return foodFromJson(response.body);
    } else {
      throw Exception('Failed to load food');
    }
  }
}
