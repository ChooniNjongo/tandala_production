import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widgets/layouts/sidebars/sidebar_controller.dart';

/// A custom route observer for managing navigation events in the application.
class RouteObservers extends GetObserver {
  /// Called when a route is popped from the navigation stack.
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (previousRoute != null) {
      // Check the route name and update the active item in the sidebar accordingly
      sidebarController.activeItem.value = previousRoute.settings.name!;
    }
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (route != null) {
      sidebarController.activeItem.value = route.settings.name!;
    }
  }
}
