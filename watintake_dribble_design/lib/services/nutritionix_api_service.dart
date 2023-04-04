import 'dart:convert';

import 'package:watintake_dribble_design/constants/constants.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';
import 'package:http/http.dart' as http;

class NutritionixService {
  // http request
  // static Future<List<Common>> fetchCommonFood(String query) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(NutritionixApiUrls.baseUrl +
  //           NutritionixApiUrlEndpoints.instantSearch +
  //           query),
  //       headers: {
  //         "x-app-id": "974f7c64",
  //         "x-app-key": "10afb9cf91dc5301ae8046bc81e9daf4",
  //         "x-remote-user-id": "0",
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       var data = json.decode(response.body);
  //       var rest = data["common"] as List;
  //       print(rest);

  //       List<Common> foodList =
  //           rest.map<Common>((json) => Common.fromJson(json)).toList();
  //       return foodList;
  //     } else {
  //       throw Exception('Failed to load food');
  //     }
  //   } catch (e) {
  //     print('Error occurred while fetching common food: $e');
  //     throw Exception('Failed to load Food');
  //   }
  // }

  // static Future<List<Branded>> fetchBrandedFood(String query) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(NutritionixApiUrls.baseUrl +
  //           NutritionixApiUrlEndpoints.instantSearch +
  //           query),
  //       headers: {
  //         "x-app-id": "974f7c64",
  //         "x-app-key": "10afb9cf91dc5301ae8046bc81e9daf4",
  //         "x-remote-user-id": "0",
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       var rest = data["branded"] as List;
  //       print(rest);
  //       List<Branded> foodList =
  //           rest.map<Branded>((json) => Branded.fromJson(json)).toList();
  //       return foodList;
  //     } else {
  //       throw Exception('Failed to load food');
  //     }
  //   } catch (e) {
  //     print('Error occurred while fetching branded food: $e');
  //     throw Exception('Failed to load Food');
  //   }
  // }

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
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return foodFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load food');
    }
  }
}
