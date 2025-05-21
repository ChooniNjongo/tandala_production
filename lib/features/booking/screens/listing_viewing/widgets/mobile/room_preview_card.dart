import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/room.dart';

class TRoomPreviewCard extends StatelessWidget {
  const TRoomPreviewCard({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width / 2,
          width: MediaQuery.sizeOf(context).width / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              room.bedAndBashBoardPictures[0],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: TColors.secondaryBackground2,
            child: Text(
              room.roomDescription,
              style: TTypography.body12Regular.copyWith(
                fontSize: 10,
                color: TColors.textPrimary,
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          left: 4,
          child: Container(
            padding: const EdgeInsets.all(4),
            color: TColors.primaryBackground,
            child: Text(
              "K ${room.price.toInt()}",
              style: TTypography.body12Regular.copyWith(
                fontSize: 10,
                color: TColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}