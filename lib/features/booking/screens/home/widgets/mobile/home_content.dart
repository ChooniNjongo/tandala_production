import 'package:flutter/material.dart';

// Import necessary widgets

// Import necessary controllers

// Import utility classes
import '../../../../controllers/nav_bar_controller.dart';
import 'body_slivers.dart';
import 'my_sliver_app_bar.dart';

// 2. Modified HomeContent widget to use the scroll controller
class HomeContent extends StatelessWidget {
  final NavBarController navBarController;

  const HomeContent({super.key, required this.navBarController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: navBarController.scrollController, // Add this line
      slivers: [
        // Top Filter SliverAppBar
        MySliverAppBar(),
        // Property Listings SliverList
        BodySlivers(),
      ],
    );
  }
}
