import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';


class CheckOutDates extends StatelessWidget {
  final bool isSelected;
  const CheckOutDates({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: isSelected
            ? TColors.textPrimary.withOpacity(0.1)
            : Colors.transparent,
      ),
      width: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Check-in",
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
              "Add dates",
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

