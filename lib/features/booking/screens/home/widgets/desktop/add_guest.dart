import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class AddGuestCount extends StatelessWidget {
  final bool isSelected;

  const AddGuestCount({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: isSelected
            ? TColors.textPrimary.withOpacity(0.1)
            : Colors.transparent,
      ),

      width: 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Who",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'InterDisplay',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  height: 1.4,
                  letterSpacing: 0,
                  color: TColors.textPrimary),
            ),
            Text(
              "Add guests",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'InterDisplay',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  height: 1.4,
                  letterSpacing: 0,
                  color: TColors.textPrimary.withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }
}
