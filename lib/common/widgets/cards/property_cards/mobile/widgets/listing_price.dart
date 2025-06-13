import 'package:flutter/material.dart';

import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../utils/constants/colors.dart';

class ListingPriceAndViews extends StatelessWidget {
  const ListingPriceAndViews({
    super.key,
    required this.listing,
  });

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\$870',
              style: TextStyle(
                color: TColors.white,
                fontFamily: 'InterDisplay', // Font family: Inter Display
                fontWeight: FontWeight.w500, // Font weight: 500 (Medium)
                fontSize: 14, // Font size: 15px
                height: 1.4, // Line height: 140%
                letterSpacing: 0, // Letter spacing: 0px
              ),
            ),
            SizedBox(width: 4,),
            Text(
              '/night',
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
        Text(
          '120 views',
          style: TextStyle(
            color: Color(0xFF6D6D6D),
            fontFamily: 'Inter Display', // Custom font
            fontWeight: FontWeight.w400, // Regular weight (400)
            fontSize: 11, // 14px font size
            height: 1.4, // 140% line heigh
            letterSpacing: 0, // 0px letter spacing
          ),
        )
      ],
    );
  }
}
