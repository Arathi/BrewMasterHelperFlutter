import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_page.dart';

class HomePageController extends BasePageController {
  static HomePageController get to => Get.find();
}

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
      bottomNavigationBar: Obx(() => buildNavigationBar(context)),
    );
  }
}
