import 'package:brewmaster_helper/pages/base_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientPageController extends BasePageController {
  static IngredientPageController get to => Get.find();
}

/*
class IngredientPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IngredientPageController());
  }
}
*/

class IngredientPage extends BasePage<IngredientPageController> {
  Widget buildBody(BuildContext context, IngredientPageController controller) {
    return const Center(
      child: Text("Ingredient Page"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final IngredientPageController controller = Get.find();
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
