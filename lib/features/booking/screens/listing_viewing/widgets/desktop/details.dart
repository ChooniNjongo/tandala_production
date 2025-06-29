import 'package:cwt_ecommerce_admin_panel/features/booking/models/property/listing_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/image_strings.dart';

class Details extends StatelessWidget {
  final ListingModel listing;

  const Details({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: const Color(0xFF1A2323)),
      child: const Row(
        children: [
          /// Square
          DetailItem(detail: "1,800 Sq Ft", icon: TImages.arrows),
            SizedBox(width: 24,),
          /// Bed room Count
          DetailItem(detail: "2 Bedrooms", icon: TImages.bed),
          SizedBox(width: 24,),
          /// Bathroom Count

          DetailItem(detail: "3 Bathroom", icon: TImages.bathtub)
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String detail;
  final String icon;

  const DetailItem({super.key, required this.detail, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(
          width: 8,
        ),
        Text(
          detail,
          style: const TextStyle(
            color: Color(0xFFE5F7F9),
            fontFamily: 'Inter Display',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.5, // 150% line height
          ),
        )
      ],
    );
  }
}
