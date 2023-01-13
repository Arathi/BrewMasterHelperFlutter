import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_page.dart';

class CalculatePage extends BasePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Calculate Page")),
      bottomNavigationBar: Obx(() => buildNavigationBar(context)),
    );
  }
}
