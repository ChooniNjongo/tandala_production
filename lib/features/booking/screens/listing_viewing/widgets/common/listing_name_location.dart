import 'package:flutter/material.dart';

import '../../../../models/property/listing_model.dart';

class ListingNameLocation extends StatelessWidget {
  const ListingNameLocation({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "${listing.propertyName}, ${listing.city}.",
          style: const TextStyle(
              fontFamily: 'Lora',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ],
    );
  }
}
