import 'package:flutter/material.dart';

// Import necessary widgets

// Import necessary controllers

// Import utility classes
import 'body_slivers.dart';
import 'my_sliver_app_bar.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        // Top Filter SliverAppBar
        MySliverAppBar(),
        // Property Listings SliverList
        BodySlivers(),
      ],
    );
  }
}
