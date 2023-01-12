import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePageController extends GetxController {
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

abstract class BasePage<C> extends GetView<C> {
  Widget buildNavigationBar(
    BuildContext context,
    int tabIndex,
    Function(int)? onTap,
  ) {
    const items = [
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.home),
        label: "首页",
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.gesture),
        label: "原料列表",
      ),
      // BottomNavigationBarItem(
      //   backgroundColor: Colors.blue,
      //   icon: Icon(Icons.calculate),
      //   label: "计算器",
      // ),
      // BottomNavigationBarItem(
      //   backgroundColor: Colors.blue,
      //   icon: Icon(Icons.task),
      //   label: "进度管理",
      // ),
    ];
    return BottomNavigationBar(
      items: items,
      currentIndex: tabIndex,
      type: BottomNavigationBarType.shifting,
      onTap: onTap,
    );
  }
}
