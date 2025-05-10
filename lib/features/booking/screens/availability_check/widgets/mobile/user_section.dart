import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import 'booked_unit_images.dart';

class UserSection extends StatelessWidget {
  final Booking booking;

  const UserSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookedUnitImages(booking: booking),
        const SizedBox(height: TSizes.spaceBtwSections),
        const QuestionContainer(
          question: "We are waiting for host to confirm availability.",
          body:
              "This can take a few minutes or more depending on host, you are NOT going to pay until we confirm.",
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

      ],
    );
  }
}
