import 'package:brewmaster_helper/components/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePageController extends GetxController {}

abstract class BasePage<C> extends GetView<C> {
  Widget buildNavigationBar(BuildContext context) {
    final NavigationBarController controller = Get.find();
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
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.calculate),
        label: "计算器",
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.task),
        label: "进度管理",
      ),
    ];
    return BottomNavigationBar(
      items: items,
      currentIndex: controller.tabIndex.value,
      type: BottomNavigationBarType.shifting,
      onTap: controller.onNavigationBarTap,
    );
  }
}
