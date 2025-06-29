import 'package:cwt_ecommerce_admin_panel/features/booking/models/property/listing_model.dart';
import 'package:flutter/material.dart';

class ListingSubtitle extends StatelessWidget {
  final ListingModel listing;

  const ListingSubtitle({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Lorem ipsum description for ad here',
          style: TextStyle(
            color: Color(0xFF6D6D6D),
            fontFamily: 'InterDisplay',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.4, // 140% line height
          ),
        ),
      ],
    );
  }
}
