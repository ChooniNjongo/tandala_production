import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/pages/action.dart';
import '../../../models/property/room.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/botton_container.dart';

class BookingRequestMobileScreen extends StatelessWidget {
  const BookingRequestMobileScreen({super.key, required this.room});

  final Room? room;

  @override
  Widget build(BuildContext context) {
    final room = Get.arguments;
    return ActionPage(
      body: BookingRequestBody(room: room),
      buttonContainer: BookingRequestButtonContainer(room: room!),
    );
  }
}
