import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_page.dart';

class ProgressPage extends BasePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Progress Page")),
      bottomNavigationBar: Obx(() => buildNavigationBar(context)),
    );
  }
}
