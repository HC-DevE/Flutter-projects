import 'dart:convert';

import 'package:watintake_dribble_design/constants/constants.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';
import 'package:http/http.dart' as http;

class NutritionixService {
  //http request
  static Future<List<Common>> fetchFood(String query) async {
    final response = await http.get(
      Uri.parse(NutritionixApiUrls.baseUrl +
          NutritionixApiUrlEndpoints.instantSearch +
          query),
      headers: {
        "x-app-id": "29e1a47d",
        "x-app-key": "8cd406e41e5fccc4a7a4ab9b94965a32",
        "x-remote-user-id": "0",
      },
    );
    // print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      return (jsonDecode(response.body)['common'] as List)
          .map((e) => Common.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load food');
    }
  }
}
