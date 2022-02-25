import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final pageController = PageController(viewportFraction: 0.9);

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
