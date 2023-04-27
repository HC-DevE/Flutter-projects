import 'dart:convert';

import 'package:http/http.dart' as http;

const String nutritionixUrl = 'https://trackapi.nutritionix.com/v2/';

Future<http.Response> fetchNutritionData(String query) async {
  final dataFromJson;
  final response = await http.get(
    Uri.parse('${nutritionixUrl}search/instant?query=$query'),
    headers: {
      'x-app-id': '29e1a47d',
      'x-app-key': '8cd406e41e5fccc4a7a4ab9b94965a32',
      'x-remote-user-id': '0',
    },
  );

  if (response.statusCode == 200) {
    // Handle successful response
    dataFromJson = jsonDecode(response.body);
  } else {
    // Handle error response
    dataFromJson = jsonDecode(response.statusCode.toString());
  }
  return dataFromJson;
}

