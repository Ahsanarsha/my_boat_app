import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  static const builderKey = 'key';
  int navBarIndex = 0;
  PageController pageController = PageController();

  updateNavBarIndex(int index) {
    navBarIndex = index;
    pageController.jumpToPage(index);
    update([builderKey]);
  }
}
