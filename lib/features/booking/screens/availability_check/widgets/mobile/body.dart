import 'package:cwt_ecommerce_admin_panel/features/booking/screens/availability_check/widgets/mobile/user_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import '../../../../models/property/room.dart';
import 'lister_section.dart';

class AvailabilityCheckBody extends StatelessWidget {
  final Booking booking;

  const AvailabilityCheckBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child:
          uid == booking.listing.userId
              ? ListerSection(booking: booking)
              : UserSection(booking: booking),
    );
  }
}

String getRoomImage(Booking booking) {
  // Find the room that matches the roomId in the booking
  Room? room = booking.listing.rooms.firstWhereOrNull(
    (room) => room.roomId == booking.roomId,
  );

  // Return the first image if available, otherwise return a default image
  return room?.bedAndBashBoardPictures.isNotEmpty == true
      ? room!.bedAndBashBoardPictures.first
      : 'https://via.placeholder.com/150'; // Provide a placeholder if no image is found
}
