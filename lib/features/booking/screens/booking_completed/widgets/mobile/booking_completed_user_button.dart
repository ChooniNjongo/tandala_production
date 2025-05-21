import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../routes/routes.dart';
import '../../../../models/booking/booking.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';

class BookingCompletedUserBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const BookingCompletedUserBottomNavigationButtons({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  TRoutes.places,
                );
              },
              child: const Text('See Places'),
            ),
          ),
        ],
      ),
    );
  }
}
