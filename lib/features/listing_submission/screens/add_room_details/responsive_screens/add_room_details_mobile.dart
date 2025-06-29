import 'package:flutter/material.dart';
import '../../add_room/widgets/add_room_bottom_navigation_bar.dart';
import '../widgets/body.dart';

class AddRoomDetailsMobileScreen extends StatelessWidget {
  const AddRoomDetailsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddRoomDetailsBody(),
      bottomNavigationBar:  AddRoomBottomNavigationBar(
      )
    );
  }
}
