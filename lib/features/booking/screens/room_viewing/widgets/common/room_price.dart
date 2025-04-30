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
      borderWidth: 1,
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(4),
      radius: 4,
      showBorder: true,
      borderColor: TColors.iconBorder,
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
                text: ' K ', // Add the currency initial
                style: TTypography.h3),
            TextSpan(
                text: '${room.price.toInt()}',
                // Display the room price dynamically
                style: TTypography.h3),
            const TextSpan(
                text: '  night', // Display the room price dynamically
                style: TTypography.label12Regular),
          ],
        ),
      ),
    );
  }
}
