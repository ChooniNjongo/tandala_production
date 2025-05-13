import 'package:flutter/material.dart';

import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class CheckInUserSection extends StatelessWidget {
  final Booking booking;

  const CheckInUserSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          /// Image Container
          BookedUnitImages(booking: booking),
          const SizedBox(height: TSizes.spaceBtwSections),
          const QuestionContainer(
            question: TTexts.checkInInstruction1,
            body: TTexts.checkInInstruction2,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
