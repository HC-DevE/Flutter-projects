import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / (screenHeight / 320);
  static double pageViewContainer = screenHeight / (screenHeight / 220);
  static double pageViewTextContainer = screenHeight / (screenHeight / 130);

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
