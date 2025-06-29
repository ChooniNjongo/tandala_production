import 'package:cwt_ecommerce_admin_panel/features/booking/models/property/listing_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';

class ListingTitle extends StatelessWidget {
  final ListingModel listing;

  const ListingTitle({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        // Place name
        const Text(
          "Sunset Haven Apartments",
          style: TextStyle(
            color: TColors.textPrimary,
            fontFamily: 'InterDisplay',
            fontSize: 56,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        // Verification Badge
        const SizedBox(
          width: 12,
        ),
        SvgPicture.asset(TImages.verify),
      ],
    );
  }
}
