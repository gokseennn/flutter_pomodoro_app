import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerAppController extends GetxController {
  void openDrawer() {
    if (Get.isRegistered<ScaffoldState>()) {
      Get.find<ScaffoldState>().openDrawer();
    } else {
      Get.snackbar('Error', 'Scaffold not found');
    }
  }
}
