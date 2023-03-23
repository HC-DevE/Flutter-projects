

import 'package:get/get.dart';

class Dimension {

  static double pageViewHeight = Get.context!.height;
  static double pageViewWidth = Get.context!.width;
  static double pageViewHeightWithSafeArea = Get.context!.height -
      Get.context!.mediaQueryPadding.top -
      Get.context!.mediaQueryPadding.bottom;
  static double pageViewWidthWithSafeArea = Get.context!.width -
      Get.context!.mediaQueryPadding.left -
      Get.context!.mediaQueryPadding.right;

  //static double get statusBarHeight => Get.context!.statusBarHeight;
}
