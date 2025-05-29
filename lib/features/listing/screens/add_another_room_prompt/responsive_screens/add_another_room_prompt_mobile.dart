import 'package:flutter/material.dart';

import '../widgets/add_another_room_bottom_navigation.dart';
import '../widgets/body.dart';

class AddAnotherRoomPromptMobileScreen extends StatelessWidget {
  const AddAnotherRoomPromptMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddAnotherRoomPromptBody(),
        bottomNavigationBar:  AddAnotherRoomBottomNavigation()
    );
  }
}
