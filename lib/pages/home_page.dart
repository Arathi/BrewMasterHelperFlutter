import 'package:brewmaster_helper/brewmaster_helper_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'base_page.dart';

class HomePageController extends BasePageController {
  static HomePageController get to => Get.find();
}

/*
class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
*/

class HomePage extends BasePage<HomePageController> {
  Widget buildBody(BuildContext context, HomePageController controller) {
    return const Center(
      child: Text("Home Page"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.find();
    return Scaffold(
      body: buildBody(context, controller),
      bottomNavigationBar: Obx(() => buildNavigationBar(
            context,
            controller.tabIndex.value,
            controller.onNavigationBarTap,
          )),
    );
  }
}
