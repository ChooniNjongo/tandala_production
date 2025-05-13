import 'package:flutter/material.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/room.dart';

class RoomPrice extends StatelessWidget {
  const RoomPrice({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      backgroundColor: TColors.secondaryBackground2,
      elevation: 6,
      borderWidth: 1,
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(8),
      radius: 32,
      showBorder: true,
      borderColor: TColors.iconBorder,
      child: RichText(
        text: TextSpan(
          children: [
             TextSpan(
                text: ' K ', // Add the currency initial
                style: TTypography.body16Regular.copyWith(color: TColors.primary500)),
            TextSpan(
                text: '${room.price.toInt()}',
                // Display the room price dynamically
                style: TTypography.body16Bold.copyWith(color: TColors.primary500)),
             TextSpan(
                text: '  night', // Display the room price dynamically
                style: TTypography.label12Regular.copyWith(color: TColors.primary500)),
          ],
        ),
      ),
    );
  }
}
