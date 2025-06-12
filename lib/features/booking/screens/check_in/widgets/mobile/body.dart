import 'package:flutter/material.dart';
import '../../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import 'check_in_owner_section.dart';
import 'check_in_user_section.dart';

class CheckInBody extends StatelessWidget {
  final Booking booking;
  const CheckInBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child:
          uid == booking.listing.userId
              ?  CheckInOwnerSection(booking:booking)
              :  CheckInUserSection(booking: booking,),
    );
  }
}
