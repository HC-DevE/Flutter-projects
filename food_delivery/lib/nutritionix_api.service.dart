import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

const String nutritionixUrl = 'https://trackapi.nutritionix.com/v2/';

Future<void> fetchNutritionData(String query) async {
  Future nutritionData;
  final response = await http.get(
    Uri.parse('${nutritionixUrl}search/instant?query=$query'),
    headers: {
      'x-app-id': '29e1a47d',
      'x-app-key': '8cd406e41e5fccc4a7a4ab9b94965a32',
    },
  );

  if (response.statusCode == 200) {
    // Handle successful response
    print(response.body);
    nutritionData = jsonDecode(response.body);
    print(nutritionData);
  } else {
    // Handle error response
    print(response.statusCode);
  }
}
