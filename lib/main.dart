import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/navigation_bar.dart';
import 'pages/home_page.dart';
import 'pages/ingredient_page.dart';
import 'pages/calculate_page.dart';
import 'pages/progress_page.dart';

class BrewMasterHelperController extends GetxController {}

class BrewMasterHelperApp extends StatelessWidget {
  // const BrewMasterHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavigationBarController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => IngredientPageController());

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
        GetPage(
          name: "/calculates",
          page: () => CalculatePage(),
        ),
        GetPage(
          name: "/progress",
          page: () => ProgressPage(),
        ),
      ],
      initialRoute: "/home",
    );
  }
}

void main() {
  runApp(BrewMasterHelperApp());
}
