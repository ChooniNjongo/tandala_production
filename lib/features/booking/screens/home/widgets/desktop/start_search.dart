import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/desktop/search_destination.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/image_strings.dart';
import 'add_guest.dart';
import 'check_in.dart';
import 'check_out.dart';

class StartSearch extends StatelessWidget {
  const StartSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        right: 16,
        bottom: 8,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: TColors.textPrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          /// Search Destination
          const SearchDestination(isSelected: false),
          const SizedBox(width: 24),
          Container(
              height: 32,
              width: 1,
              color: TColors.textPrimary.withOpacity(0.5)),

          /// Check In Date
          const SizedBox(width: 24),

          const CheckInDates(isSelected: false),
          const SizedBox(width: 24),

          Container(
              height: 32,
              width: 1,
              color: TColors.textPrimary.withOpacity(0.5)),

          /// Check out Date
          const SizedBox(width: 24),
          const CheckOutDates(isSelected: false),

          /// Guest Counts
          const SizedBox(width: 24),

          Container(
              height: 32,
              width: 1,
              color: TColors.textPrimary.withOpacity(0.5)),
          const SizedBox(width: 24),

          const AddGuestCount(isSelected: false),
          const SizedBox(width: 24),

          Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00AFC1)
            ),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  TImages.searchStart,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
