import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.24;
  static double pageViewContainer = screenHeight / 3.26;
  static double pageViewTextContainer = screenWidth / 3.84;

  //dynamic height
  static double height10 = screenHeight / 71.9;
  static double height15 = screenHeight / 47.9;
  static double height20 = screenHeight / 35.95;
  static double height30 = screenHeight / 23.97;

  //dynamic width
  static double width10 = screenWidth / 50;
  static double width15 = screenWidth / 33.33;
  static double width20 = screenWidth / 25;
  static double width30 = screenWidth / 16.67;

  static double font20 = screenHeight / 35.95;
  static double radius20 = screenHeight / 35.95;
  static double radius30 = screenHeight / 23.97;
}
