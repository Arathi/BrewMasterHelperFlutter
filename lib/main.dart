import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home_page.dart';
import 'pages/ingredient_page.dart';

class BrewMasterHelperController extends GetxController {}

class BrewMasterHelperApp extends StatelessWidget {
  // const BrewMasterHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrewMasterHelperController();
    Get.put(HomePageController());
    Get.put(IngredientPageController());

    return GetMaterialApp(
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/ingredients",
          page: () => IngredientPage(),
        ),
        // GetPage(
        //   name: "/calculates",
        //   page: () => HomePage(),
        //   binding: HomePageBinding(),
        // ),
        // GetPage(
        //   name: "/progress",
        //   page: () => HomePage(),
        //   binding: HomePageBinding(),
        // ),
      ],
      home: HomePage(),
    );
  }
}

void main() {
  runApp(BrewMasterHelperApp());
}
