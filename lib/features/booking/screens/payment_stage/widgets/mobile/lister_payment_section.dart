import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class ListerPaymentSection extends StatelessWidget {
  final Booking booking;

  const ListerPaymentSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const QuestionContainer(
            question: "Waiting for payment.",
            body: "Please wait for user to make payment.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const Center(
            child: SpinKitPouringHourGlassRefined(
              color: TColorSystem.primary500,
              size: 49.0,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          /// Image Container
          BookedUnitImages(booking: booking),
        ],
      ),
    );
  }
}
