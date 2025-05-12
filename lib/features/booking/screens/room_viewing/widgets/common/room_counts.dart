import 'package:flutter/material.dart';

import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/room.dart';

class RoomCounts extends StatelessWidget {
  final Room room;

  const RoomCounts({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          room.guestCount.toString(),
          style: roomCountTextStyle(),
        ),
        Text(
          " guests",
          style: roomCountTextStyle(),
        ),
        const SizedBox(
          width: 2,
        ),
        Center(
          child: Container(
            color: Colors.white.withOpacity(0.3),
            width: 1,
            height: 1,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          room.bathCount.toString(),
          style: roomCountTextStyle(),
        ),
        Text(
          " bathrooms",
          style: roomCountTextStyle(),
        ),
        const SizedBox(
          width: 2,
        ),
        Center(
          child: Container(
            color: Colors.white.withOpacity(0.3),
            width: 1,
            height: 1,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          room.bedCount.toString(),
          style: roomCountTextStyle(),
        ),
        Text(
          " beds",
          style: roomCountTextStyle(),
        ),
        const SizedBox(
          width: 2,
        ),
      ],
    );
  }
}

TextStyle roomCountTextStyle() {
  return TTypography.label12Regular.copyWith(
      color: Colors.white.withOpacity(0.5),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w200,
      fontSize: 12);
}
