import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import 'check_in_owner_section.dart';
import 'check_in_user_section.dart';

class CheckInBody extends StatelessWidget {
  final Booking booking;
  const CheckInBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final uid = storage.read("uid") as String;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child:
          uid == booking.listing.userId
              ? const CheckInOwnerSection()
              : const CheckInUserSection(),
    );
  }
}
