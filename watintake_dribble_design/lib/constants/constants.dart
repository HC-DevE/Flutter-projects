import 'package:get/get.dart';

class NutritionixApiUrls {
  static String baseUrl = "https://trackapi.nutritionix.com/v2/";

  static String appID = "974f7c64"; //29e1a47d
  static String appKey =
      "10afb9cf91dc5301ae8046bc81e9daf4"; //8cd406e41e5fccc4a7a4ab9b94965a32
  static String remoteUserId = "0";
}

class NutritionixApiUrlEndpoints {
  static String instantSearch = "search/instant?query=";
  static String userData = "me";
  static String exercice = "/natural/exercise";
  static String signUp = "auth/signup";
  static String signIn = "auth/signin";
}

class NutritionixUserData {
  //test user
  static String? userId = "wZ8dB3eLaM9yMgp"; 
  static String? userToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTg1Mzc5MSwiaWF0IjoxNjgwNDU2MDkwLCJleHAiOjE2ODMxMzQ0OTB9.ht_f-C6Y0UuSN3SwVsUOwKQE-0uBcLf7aobLhzTgLDo";
}

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dynamic height
  static double height5 = screenHeight / (screenHeight / 5);
  static double height10 = screenHeight / (screenHeight / 10);
  static double height15 = screenHeight / (screenHeight / 15);
  static double height20 = screenHeight / (screenHeight / 20);
  static double height30 = screenHeight / (screenHeight / 30);
  static double height40 = screenHeight / (screenHeight / 40);
  static double height50 = screenHeight / (screenHeight / 50);

  //dynamic width
  static double width10 = screenWidth / (screenWidth / 10);
  static double width15 = screenWidth / (screenWidth / 15);
  static double width20 = screenWidth / (screenWidth / 20);
  static double width30 = screenWidth / (screenWidth / 30);
  static double width40 = screenWidth / (screenWidth / 40);
  static double width50 = screenWidth / (screenWidth / 50);

  //dynamic font size
  static double font16 = screenHeight / (screenHeight / 16);
  static double font20 = screenHeight / (screenHeight / 20);
  static double font26 = screenHeight / (screenHeight / 26);
  //dynamic radius size
  static double radius20 = screenHeight / (screenHeight / 20);
  static double radius30 = screenHeight / (screenHeight / 30);

  //icon size
  static double iconSize24 = (screenHeight * 24) / screenHeight;
  static double iconSize16 = (screenHeight * 16) / screenHeight;

  //listView size
  static double listViewImgHeight120 = screenHeight / (screenHeight / 120);
  static double listViewImgWidth120 = screenWidth / (screenWidth / 120);
  static double listViewTextContainer100 = screenHeight / (screenHeight / 100);

  //popular food
  static double popularFoodImgSize350 = screenHeight / (screenHeight / 350);

  //bottom height
  static double bottomHeightBar120 = screenHeight / (screenHeight / 120);
}
