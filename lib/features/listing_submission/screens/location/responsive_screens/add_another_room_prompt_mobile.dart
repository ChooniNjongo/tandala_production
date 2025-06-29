import 'package:flutter/material.dart';

import '../widgets/add_another_room_prompt_bottom_navigation_bar.dart';
import '../widgets/body.dart';

class LocationMobileScreen extends StatelessWidget {
  const LocationMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LocationBody(),
      bottomNavigationBar: AddAnotherRoomPromptBottomNavigationBar()
    );
  }
}
