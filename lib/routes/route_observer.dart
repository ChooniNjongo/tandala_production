import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widgets/layouts/sidebars/sidebar_controller.dart';

/// A custom route observer for managing navigation events in the application.
class RouteObservers extends GetObserver {
  /// Called when a route is popped from the navigation stack.
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (previousRoute?.settings.name != null) {
      sidebarController.activeItem.value = previousRoute!.settings.name!;
    } else {
      sidebarController.activeItem.value = 'unknown';
    }
  }

  /// Called when a route is pushed onto the navigation stack.
  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (route?.settings.name != null) {
      sidebarController.activeItem.value = route!.settings.name!;
    } else {
      sidebarController.activeItem.value = 'unknown';
    }
  }
}
