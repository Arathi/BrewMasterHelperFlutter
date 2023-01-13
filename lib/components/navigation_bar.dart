import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  var tabIndex = 0.obs;

  var tabNames = [
    "/home",
    "/ingredients",
    "/calculates",
    "/progress",
  ];

  void onNavigationBarTap(int index) {
    if (index >= 0 && index < tabNames.length) {
      tabIndex.value = index;
      Get.toNamed(tabNames[index]);
    } else {
      print("无效的页面：$index");
    }
  }
}
