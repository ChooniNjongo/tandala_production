import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../models/property/room.dart';

class TRoomPreviewCard extends StatelessWidget {
  const TRoomPreviewCard({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).width / 2 + 40,
              width: MediaQuery.sizeOf(context).width / 2.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  room.bedAndBashBoardPictures[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 56,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end:  Alignment.topCenter,
                    colors: [
                      TColors.primary.withOpacity(0.9), // lighter at bottom
                      TColors.primary.withOpacity(0.2), // darker at top

                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    room.roomDescription.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )

          ],
        ),

      ],
    );
  }
}
