import 'package:flutter/material.dart';
import '../widgets/add_room_bottom_navigation_bar.dart';
import '../widgets/body.dart';

class AddRoomMobileScreen extends StatelessWidget {
  const AddRoomMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddRoomBody(),
      bottomNavigationBar :  AddRoomBottomNavigationBar()
    );
  }
}
