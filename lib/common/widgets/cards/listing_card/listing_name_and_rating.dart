import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../../../../features/booking/models/property/listing_model.dart";
import "../../../../utils/constants/colors.dart";
import "../../../../utils/constants/image_strings.dart";

class ListingNameAndRating extends StatelessWidget {
  const ListingNameAndRating({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(  // Add this Expanded widget
          child: Text(
            "Sunset Haven Apartments",
            style: TextStyle(
              color: Color(0xFF6D6D6D),
              fontFamily: 'InterDisplay',
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(width: 8), // Add spacing between text and rating
        Row(
          children: [
            SvgPicture.asset(TImages.ratingStar, height: 16, width: 16),
            const SizedBox(width: 4),
            const Text(
              '4.7',
              style: TextStyle(
                color: Color(0xFF6D6D6D),
                fontFamily: 'InterDisplay',
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            )
          ],
        )
      ],
    );
  }
}