import 'package:flutter/material.dart';

import '../widgets/body.dart';
import '../widgets/display_cover_bottom_navigation.dart';

class DisplayCoverMobileScreen extends StatelessWidget {
  const DisplayCoverMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainCoverBody(),
      bottomNavigationBar: DisplayCoverBottomNavigation(),
    );
  }
}
