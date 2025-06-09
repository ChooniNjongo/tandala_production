import 'package:flutter/material.dart';

import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';

class ListingPriceAndViews extends StatelessWidget {
  const ListingPriceAndViews({
    super.key,
    required this.listing,
  });

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        RichText(
          text: const TextSpan(
            children: <InlineSpan>[
               TextSpan(
               text:  'Starting  ',
                style: TextStyle(
                  color: Color(0xFF6D6D6D),
                  fontFamily: 'InterDisplay', // Custom font
                  fontWeight: FontWeight.w400, // Regular weight (400)
                  fontSize: 11, // 14px font size
                  height: 1.4, // 140% line height
                  letterSpacing: 0, // 0px letter spacing
                ),
              ),
              TextSpan(
                text: 'K2500',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'InterDisplay', // Font family: Inter Display
                  fontWeight: FontWeight.w500, // Font weight: 500 (Medium)
                  fontSize: 20, // Font size: 20px
                  height: 1.4, // Line height: 140%
                  letterSpacing: 0, // Letter spacing: 0px
                ),
              ),
              TextSpan(
                text: ' /night',
                style: TextStyle(
                  color: Color(0xFF6D6D6D),
                  fontFamily: 'InterDisplay', // Custom font
                  fontWeight: FontWeight.w400, // Regular weight (400)
                  fontSize: 14, // 14px font size
                  height: 1.4, // 140% line height
                  letterSpacing: 0, // 0px letter spacing
                ),
              ),
            ],
          ),
        ),
        const Text(
          '120 views',
          style: TextStyle(
            color: Color(0xFF6D6D6D),
            fontFamily: 'Inter Display', // Custom font
            fontWeight: FontWeight.w400, // Regular weight (400)
            fontSize: 14, // 14px font size
            height: 1.4, // 140% line height
            letterSpacing: 0, // 0px letter spacing
          ),
        )
      ],
    );
  }
}
