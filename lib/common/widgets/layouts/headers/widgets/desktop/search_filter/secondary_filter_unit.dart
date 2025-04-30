import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../../utils/constants/colors.dart';

class SecondaryFilterUnit extends StatelessWidget {
  const SecondaryFilterUnit(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.activeIcon});

  final String text;
  final bool isSelected;
  final IconData activeIcon;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showShadow: false,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      showBorder: isSelected ? true : false,
      borderWidth: 1,
      borderColor: isSelected ? TColors.white : TColors.white,
      radius: 8,
      backgroundColor:
          isSelected ? TColors.white.withOpacity(1) : TColors.white,
      child: Column(
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: isSelected
                        ? TColors.primary300
                        : TColors.textIconFilterInactive,
                  ),
              fontSize: isSelected ? 11 : 11,
              fontStyle: FontStyle.normal,
            ),
          ),
          Icon(
            activeIcon,
            size: 24,
            color: isSelected
                ? TColors.primary300
                : TColors.darkerGrey.withOpacity(0.4),
          )
        ],
      ),
    );
  }
}
