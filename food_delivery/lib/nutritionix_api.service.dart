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
    },
  );

  if (response.statusCode == 200) {
    // Handle successful response
    dataFromJson = jsonDecode(response.body);
  } else {
    // Handle error response
    print(response.statusCode);
    dataFromJson = jsonDecode(response.statusCode.toString());
  }
  return dataFromJson;
}

class ReponseDataType {
            final String food_name = "apple";
            late final  serving_unit;
             late final  tag_name;
             late final  serving_qty;
             late final  common_type;
             late final  tag_id;
             late final  Map<dynamic, String> photo;
             late final locale;
        }
