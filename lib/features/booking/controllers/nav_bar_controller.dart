
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller to manage navbar visibility
class NavBarController extends GetxController {
  RxBool isNavBarVisible = true.obs;
  ScrollController scrollController = ScrollController();
  double lastScrollPosition = 0.0;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final currentScrollPosition = scrollController.offset;

    // Show navbar when scrolling up, hide when scrolling down
    if (currentScrollPosition > lastScrollPosition && currentScrollPosition > 100) {
      // Scrolling down - hide navbar
      if (isNavBarVisible.value) {
        isNavBarVisible.value = false;
      }
    } else if (currentScrollPosition < lastScrollPosition) {
      // Scrolling up - show navbar
      if (!isNavBarVisible.value) {
        isNavBarVisible.value = true;
      }
    }

    lastScrollPosition = currentScrollPosition;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}