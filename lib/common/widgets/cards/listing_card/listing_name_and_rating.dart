import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../../../../features/booking/models/property/listing_model.dart";
import "../../../../utils/constants/image_strings.dart";

class ListingNameAndRating extends StatelessWidget {
  const ListingNameAndRating({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Sunset Haven Apartments",
          style: TextStyle(
            color: Color(0xFF6D6D6D),
            fontFamily: 'InterDisplay',
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            height: 1.4, // This is the line height (22.4 / 16 = 1.4)
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(TImages.ratingStar),
            const SizedBox(
              width: 4,
            ),
            const Text(
              '4.7',
              style: TextStyle(
                color: Color(0xFF6D6D6D),
                fontFamily: 'InterDisplay',
                fontSize: 13,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                height: 1.4, // 19.6 / 14 = 1.4
              ),
            )
          ],
        )
      ],
    );
  }
}
